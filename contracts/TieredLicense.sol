pragma solidity 0.6.8;
import '@openzeppelin/contracts/math/SafeMath.sol';

contract TieredLicense {
    using SafeMath for uint256;

    enum Tiers { None, Basic, Pro, Trial }
    struct LicenseData {
        Tiers tier;
        uint256 expiration;
    }
    mapping(uint256 => LicenseData) private data;

    /**
     * @dev Checks tier and expiration of the license
     *      Throws an error if the license is expired, or if the tier is incorrect.
     * @param license uint256 - index of the ERC721 license token
     * @param tier Tier - the tier of the license that is expected by the app
     * @return bool - true if the license is available
     */
    function checkLicenseTier(uint256 license, Tiers tier) public returns (bool) {
        require(data[license].tier == tier, "The license does not have the required tier.");
        require(now < data[license].expiration, "The license is expired.");
        return true;
    }

    /**
     * @dev Reads information about the license.
     * @param license uint256 - index of the ERC721 license token
     * @return tier Tier - the tier of the license
     * @return expiration uint256 - expiration timestamp of the license
     */
    function getLicenseInfo(uint256 license) public view returns (Tiers tier, uint256 expiration) {
        return (data[license].tier, data[license].expiration);
    }

    /**
     * @dev Sets the tier of the license.
     * @param license index of the ERC721 license token
     * @param tier the tier of the license to set
     */
    function _setLicenseTier(uint256 license, Tiers tier) internal {
        data[license].tier = tier;
    }

    /**
     * @dev Sets the expiration time of the license.
     * @param license index of the ERC721 license token
     * @param expiration date of expiration of the license
     */
    function _setLicenseExpiration(uint256 license, uint256 expiration) internal {
        data[license].expiration = expiration;
    }
}
