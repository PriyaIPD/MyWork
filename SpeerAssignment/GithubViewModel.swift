//
//  GithubModel.swift
//  SpeerAssignment
//
//  Created by Priya Gandhi on 2025-04-05.
//

import Foundation
import Combine

class GitHubUserViewModel: ObservableObject {
    @Published var users: [GithubUser] = []  // Stores the fetched users
    @Published var followers: [GithubFollower] = []  // Stores followers data
    @Published var following: [GithubFollowing] = []  // Stores following data
    @Published var isLoading = false  // Flag indicating the loading state
    @Published var errorMessage: String?  // Stores error message, if any

    /// Fetches a GitHub user by username.
    func fetchUser(username: String) {
        self.isLoading = true
        let url = URL(string: "https://api.github.com/users/\(username)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            
            guard let data = data else { return }
            
            do {
                let user = try JSONDecoder().decode(GithubUser.self, from: data)
                self.fetchFollowersAndFollowing(user: user)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.users = [user]
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }

    /// Fetches both followers and following for a specific user.
    func fetchFollowersAndFollowing(user: GithubUser) {
        fetchFollowers(user: user)
        fetchFollowing(user: user)
    }

    func fetchFollowers(user: GithubUser) {
        guard let url = URL(string: user.followersURL) else {
            DispatchQueue.main.async {
                self.errorMessage = "Invalid followers URL."
            }
            return
        }
        
        // Start the data task to fetch followers
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }

            // Check if data exists
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received."
                }
                return
            }
            
            // Log the raw response to debug the issue
            if let rawString = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawString)")  // This prints the raw JSON string
            }
            
            // Check the HTTP status code
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")  // Log the status code
            }

            // Attempt to decode the data into followers
            do {
                let followers = try JSONDecoder().decode([GithubFollower].self, from: data)
                DispatchQueue.main.async {
                    self.followers = followers
                }
            } catch {
                // Catch any errors during decoding
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode followers data: \(error.localizedDescription)"
                }
                print("Decoding error: \(error.localizedDescription)")  // Print the decoding error
            }
        }.resume()
    }

    func fetchFollowing(user: GithubUser) {
        let url = URL(string: user.followingURL) ?? URL(fileURLWithPath: "")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }

            guard let data = data else { return }

            do {
                let following = try JSONDecoder().decode([GithubFollowing].self, from: data)
                DispatchQueue.main.async {
                    self.following = following
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }

}
