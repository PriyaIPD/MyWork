//
//  UserProfileView.swift
//  SpeerAssignment
//
//  Created by Priya Gandhi on 2025-04-06.
//

import SwiftUI

// UserProfileView: Displays detailed information about a user and their followers/following
struct UserProfileView: View {
    @Binding var user: GithubUser   // Allow mutation of user in the parent view
    @ObservedObject var viewModel: GitHubUserViewModel  // ViewModel to hold data
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: user.avatarURL)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .padding()
                
                Text(user.name ?? "No Name")
                    .font(.title)
                    .padding(.top)
                
                Text(user.bio ?? "No bio available")
                    .padding()
                    .font(.body)
                    .foregroundColor(.gray)
                
                // Display followers and following count
                HStack {
                    NavigationLink(destination: FollowersFollowingView(user: user, type: .followers)) {
                        VStack {
                            Text("\(viewModel.followers.count) followers")
                                .font(.headline)
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: FollowersFollowingView(user: user, type: .following)) {
                        VStack {
                            Text("\(viewModel.following.count) following")
                                .font(.headline)
                        }
                        .padding()
                    }
                }
                .padding()
            }
        }
        .navigationTitle(user.login)
        .onAppear {
            viewModel.fetchFollowersAndFollowing(user: user)
        }
    }
}
