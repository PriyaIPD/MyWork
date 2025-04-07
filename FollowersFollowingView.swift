//
//  FollowersFollowingView.swift
//  SpeerAssignment
//
//  Created by Priya Gandhi on 2025-04-06.
//

import SwiftUI

// FollowersFollowingView: Displays a list of followers or following users
struct FollowersFollowingView: View {
    let user: GithubUser
    let type: FollowersFollowingType
    @StateObject private var viewModel = GitHubUserViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }

            // Display followers
            if type == .followers {
                if !viewModel.followers.isEmpty {
                    List(viewModel.followers, id: \.id) { follower in
                        HStack {
                            AsyncImage(url: URL(string: follower.avatarURL ?? "")) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text(follower.login)
                                .font(.headline)
                        }
                    }
                } else {
                    Text("No followers yet")
                        .foregroundColor(.gray)
                }
            } else {
                // Display following
                if !viewModel.following.isEmpty {
                    List(viewModel.following, id: \.id) { following in
                        HStack {
                            AsyncImage(url: URL(string: following.avatarURL ?? "")) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text(following.login)
                                .font(.headline)
                        }
                    }
                } else {
                    Text("Not following anyone yet")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle(type == .followers ? "Followers" : "Following")
        .onAppear {
            if type == .followers {
                viewModel.fetchFollowers(user: user)
            } else {
                viewModel.fetchFollowing(user: user)
            }
        }
    }
}


struct FollowerFollowingRowView: View {
    let user: GithubFollower
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.avatarURL ?? "")) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text(user.login)
                .font(.headline)
        }
    }
}

enum FollowersFollowingType {
    case followers
    case following
}
