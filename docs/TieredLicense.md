## `TieredLicense`






### `checkLicenseTier(uint256 license, enum TieredLicense.Tiers tier) → bool` (public)



Checks tier and expiration of the license
Throws an error if the license is expired, or if the tier is incorrect.


### `_setLicenseTier(uint256 license, enum TieredLicense.Tiers tier)` (internal)



Sets the tier of the license.


### `_setLicenseExpiration(uint256 license, uint256 expiration)` (internal)



Sets the expiration time of the license.



