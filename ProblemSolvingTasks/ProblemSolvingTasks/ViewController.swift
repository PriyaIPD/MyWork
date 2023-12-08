//
//  ViewController.swift
//  ProblemSolvingTasks
//
//  Created by Priya Gandhi on 2023-12-06.
//

import UIKit

class ViewController: UIViewController {
    var memo: [Int: Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
       let sum = sumOfAllIntegersFromArrays([2,3,4], [1,2,3])
        print(sum)
        }

    // Implement a function to find the first non-repeating character in a string.
    func firstChar(_ str : String) -> Character?{
        var characterFrequency = [Character : Int]()
        for char in str{
            characterFrequency[char, default: 0] += 1
        }
        
        for char in str{
            if let frequency = characterFrequency[char], frequency <= 1{
                return char
            }
        }
        return nil

    }
    
   // Write a function to check if two strings are anagrams of each other.
    func checkAnagramsOrNot(_ string1 : String, _ string2 : String) -> Bool{
        let cleanStr1 = string1.lowercased().replacingOccurrences(of: " ", with: "")
            let cleanStr2 = string2.lowercased().replacingOccurrences(of: " ", with: "")

            // Check if the sorted arrays of characters are equal
            return cleanStr1.sorted() == cleanStr2.sorted()
    }
    
    //Given an array of integers, find the subarray with the maximum sum.
    func maxSubarraySum(_ nums: [Int]) -> Int {
       
        var currentSum = nums[0]
        var maxSum = nums[0]

        for i in 1..<nums.count {
            // Choose between extending the current subarray or starting a new one
            currentSum = max(nums[i], currentSum + nums[i])
            
            // Update the maximum subarray sum
            maxSum = max(maxSum, currentSum)
        }

        return maxSum
    }
    
   // Implement a binary search algorithm on a sorted array in swift
    func binarySearch<T: Comparable>(_ array: [T], target: T) -> Int? {
        var low = 0
        var high = array.count - 1

        while low <= high {
            let mid = low + (high - low) / 2

            if array[mid] == target {
                return mid // Target found
            } else if array[mid] < target {
                low = mid + 1 // Search in the right half
            } else {
                high = mid - 1 // Search in the left half
            }
        }

        return nil // Target not found
    }

    func fibonacciSeries(upTo n: Int) -> [Int] {
        var series: [Int] = []


        var (a, b) = (0, 1)

        series.append(a)

        while series.count < n {
            series.append(b)
            (a, b) = (b, a + b)
        }

        return series
    }
    
    func reverseWords(_ sentence: String) -> String {
        let words = sentence.components(separatedBy: " ")
        let reversedWords = words.map { String($0.reversed()) }
        return reversedWords.joined(separator: " ")
    }
    
    //Remove duplicate letters from a string
    func removeDuplicateLettersFromString(_ str: String){
        
    }
    
    
    func sumOfAllIntegersFromArrays(_ array1 : [Int], _ array : [Int]) -> Int{
        let arr1 = array1
        let arr2 = array
        
        let result = [arr1.compactMap { $0 },
                      arr2.compactMap { $0 }]
            .flatMap { $0 }
            .reduce(0, +)
        return result
    }
}


