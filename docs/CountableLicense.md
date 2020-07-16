## `CountableLicense`






### `checkLicenseUse(uint256 license) → uint256` (public)



Checks remaining usages of the license.


### `_useLicense(uint256 license) → uint256` (internal)



Updates usages of licenses.
If there are no usages left, the function will throw an error.


### `_setUsageCount(uint256 license, uint256 amount)` (internal)



Sets available usages of licenses.
Amount of licenses is arbitrary. The amount can be set to 0 to disable the license.



