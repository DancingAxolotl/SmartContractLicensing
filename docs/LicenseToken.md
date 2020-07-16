## `LicenseToken`






### `issueLicense(address recipient, enum TieredLicense.Tiers tier, uint256 expiration, uint256 usages) → uint256` (public)



Issue a basic license with defined parameters.


### `useLicense(uint256 license) → uint256` (public)



Checks if the license belongs to the caller and counts usages of licenses.
This function should be called by the program if a user attempts to use their license.
If the caller is not the owner of the license or there are no usages left,
the function will throw an error.



