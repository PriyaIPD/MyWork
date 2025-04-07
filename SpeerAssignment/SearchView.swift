//
//  SearchView.swift
//  SpeerAssignment
//
//  Created by Priya Gandhi on 2025-04-06.
//

import SwiftUI

// SearchView: Displays a list of users and allows navigation to the UserProfileView
struct SearchView: View {
    @State private var username = ""  // User input for the GitHub username
    @StateObject private var viewModel = GitHubUserViewModel()  // ViewModel to hold data
    @State private var selectedUser: GithubUser? // Store the selected user to pass to the profile view
    @State private var isNavigatingToProfile = false // Track navigation to the UserProfileView
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search TextField for entering GitHub username
                TextField("Enter GitHub Username", text: $username, onCommit: {
                    viewModel.fetchUser(username: username)
                })
                .onChange(of: username) { newValue in
                    // Reset error message when user starts typing
                    viewModel.errorMessage = nil
                    
                    // If username is empty, clear the users list
                    if newValue.isEmpty {
                        viewModel.users = []  // Clear the user data
                        viewModel.isLoading = false  // Ensure loading indicator is stopped
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
                
                if !viewModel.users.isEmpty {
                    List(viewModel.users, id: \.id) { user in
                        Button(action: {
                            selectedUser = user
                            isNavigatingToProfile = true // Trigger navigation
                        }) {
                            HStack {
                                AsyncImage(url: URL(string: user.avatarURL)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(user.login)
                                        .font(.headline)
                                    Text(user.name ?? "No name")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    if let bio = user.bio {
                                        Text(bio)
                                            .font(.body)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    // Show followers and following counts
                                    HStack {
                                        Text("Followers: \(viewModel.followers.count)")
                                            .font(.footnote)
                                            .foregroundColor(.blue)
                                        
                                        Text("Following: \(viewModel.following.count)")
                                            .font(.footnote)
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(.leading, 10)
                            }
                        }
                    }
                } else {
                    Text("No users yet")
                        .foregroundColor(.gray)
                }
            }
            .background(Color.white)
            .navigationTitle("GitHub Search")
            
            // Navigation to UserProfileView
            .background(
                NavigationLink(destination: UserProfileView(user: Binding(get: {
                    selectedUser ?? GithubUser(
                        id: 0,
                        login: "Unknown",
                        avatarURL: "",
                        followersURL: "",
                        followingURL: "",
                        gistsURL: "",
                        starredURL: "",
                        subscriptionsURL: "",
                        organizationsURL: "",
                        reposURL: "",
                        eventsURL: "",
                        receivedEventsURL: "",
                        type: "User",
                        siteAdmin: false,
                        name: nil,
                        bio: nil,
                        followersCount: 0,
                        followingCount: 0
                    )
                }, set: { newUser in
                    if let index = viewModel.users.firstIndex(where: { $0.id == selectedUser?.id }) {
                        viewModel.users[index] = newUser
                    }
                }), viewModel: viewModel), isActive: $isNavigatingToProfile) {
                    EmptyView()
                }
            )
        }
    }
}

struct UserRowView: View {
    let user: GithubUser
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.avatarURL)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(user.login)
                    .font(.headline)
                Text(user.name ?? "No name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, 10)
        }
    }
}


