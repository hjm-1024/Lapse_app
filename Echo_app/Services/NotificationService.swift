//
//  NotificationService.swift
//  Echo
//
//  Created by Echo Development Team
//  Copyright © 2025 Echo. All rights reserved.
//

import Foundation
import UserNotifications

/// Service responsible for managing local push notifications
/// Based on SRS Section 4.5 - Time-Delayed Notification System
@MainActor
final class NotificationService {
    static let shared = NotificationService()

    private let notificationCenter = UNUserNotificationCenter.current()

    private init() {}

    // MARK: - Permission Management

    /// Request notification permissions from user
    /// Based on SRS Section 4.5 - Permission Request (First Launch)
    func requestAuthorization() async -> Bool {
        do {
            let granted = try await notificationCenter.requestAuthorization(options: [.alert, .sound, .badge])
            return granted
        } catch {
            print("❌ Notification permission error: \(error.localizedDescription)")
            return false
        }
    }

    /// Check current authorization status
    func checkAuthorizationStatus() async -> UNAuthorizationStatus {
        let settings = await notificationCenter.notificationSettings()
        return settings.authorizationStatus
    }

    // MARK: - Notification Scheduling

    /// Schedule a local notification for a Vibe
    /// Based on SRS Section 3.3 - FR-002: Notification Scheduling
    /// - Parameter vibe: The Vibe to schedule
    /// - Returns: Notification identifier or nil if failed
    func scheduleNotification(for vibe: Vibe) async -> String? {
        // Check authorization first
        let status = await checkAuthorizationStatus()
        guard status == .authorized else {
            print("⚠️ Notifications not authorized")
            return nil
        }

        // Create notification content
        // Based on SRS Section 4.5 - Notification Payload Structure
        let content = UNMutableNotificationContent()
        content.title = "An Echo has arrived"
        content.body = vibe.notificationBody
        content.sound = .default
        content.badge = 1

        // Attach Vibe ID to userInfo for retrieval
        content.userInfo = [
            "vibeID": vibe.id.uuidString,
            "deliveryDate": vibe.deliveryDate.timeIntervalSince1970
        ]

        // Create trigger for specific date/time
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: vibe.deliveryDate)

        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        // Create request
        let identifier = "echo-\(vibe.id.uuidString)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        do {
            try await notificationCenter.add(request)
            print("✅ Notification scheduled: \(identifier) for \(vibe.formattedDeliveryDate)")
            return identifier
        } catch {
            print("❌ Failed to schedule notification: \(error.localizedDescription)")
            return nil
        }
    }

    /// Cancel a scheduled notification
    /// Based on SRS Section 3.3 - FR-006: Scheduled Echoes Management
    /// - Parameter notificationID: The identifier of the notification to cancel
    func cancelNotification(withID notificationID: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [notificationID])
        print("🗑️ Cancelled notification: \(notificationID)")
    }

    /// Cancel all pending notifications
    /// Used when clearing all data in Settings
    func cancelAllNotifications() async {
        notificationCenter.removeAllPendingNotificationRequests()
        print("🗑️ Cancelled all pending notifications")
    }

    /// Get count of pending notifications
    /// Used to check 64-notification limit
    /// Based on SRS Section 4.5 - iOS Notification Limit Handling
    func getPendingNotificationCount() async -> Int {
        let pendingRequests = await notificationCenter.pendingNotificationRequests()
        return pendingRequests.count
    }

    /// Check if notification limit is approaching (>60 pending)
    func isApproachingLimit() async -> Bool {
        let count = await getPendingNotificationCount()
        return count >= 60
    }

    /// Handle notification limit by canceling oldest notification
    /// Based on SRS Section 4.5 - iOS Notification Limit Handling
    func handleNotificationLimit() async {
        let pendingRequests = await notificationCenter.pendingNotificationRequests()

        if pendingRequests.count >= 64 {
            // Find oldest notification (earliest trigger date)
            if let oldestRequest = pendingRequests
                .compactMap({ request -> (String, Date)? in
                    guard let trigger = request.trigger as? UNCalendarNotificationTrigger,
                          let nextTriggerDate = trigger.nextTriggerDate() else {
                        return nil
                    }
                    return (request.identifier, nextTriggerDate)
                })
                .sorted(by: { $0.1 < $1.1 })
                .first {
                cancelNotification(withID: oldestRequest.0)
                print("⚠️ Notification limit reached. Cancelled oldest notification.")
            }
        }
    }

    // MARK: - Badge Management

    /// Clear app badge count
    func clearBadge() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }

    /// Increment badge count
    func incrementBadge() async {
        let currentBadge = await UNUserNotificationCenter.current().badgeCount
        UNUserNotificationCenter.current().setBadgeCount(currentBadge + 1)
    }
}
