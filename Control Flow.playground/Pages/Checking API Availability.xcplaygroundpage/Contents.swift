//: Preivous [Early Exit](@previous)
//: ## Checking API Availability
/*:
 Swift has built-in support for checking API availability, which ensures that you don't accidentally use APIs that are unavailable on a given deployment target.
 
 The compiler uses availability information in the SDK to verify that all of the APIs used in your code are available on the deployment target specified by your project.
*/
if #available(iOS 9, OSX 10.10, *) {
    // Use iOS 9 APIs on iOS, use OS X v10.10 APIS on OS X
} else {
    // Fall back to earlier iOS and OS X APIs
}
/*:
The availability condition above specifies that on iOS, the body of the `if` executes only on iOS 9 and later; on OS X, only on OS X v10.10 and later. The last argument, `*`, is required and specifies that on any other platform, the body of the `if` executes on the minimum deployment target specified by your target.
*/
