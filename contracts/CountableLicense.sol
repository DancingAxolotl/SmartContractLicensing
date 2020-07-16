pragma solidity 0.6.8;
import '@openzeppelin/contracts/math/SafeMath.sol';

contract CountableLicense {
    using SafeMath for uint256;
    mapping(uint256 => uint256) private usages;

    /**
     * @dev Checks remaining usages of the license.
     * @param license uint256 - index of the ERC721 license token
     * @return uint256 - amount of usages left for this license
     */
    function checkLicenseUse(uint256 license) public view returns (uint256) {
        return usages[license];
    }

    /**
     * @dev Updates usages of licenses.
     *      If there are no usages left, the function will throw an error.
     * @param license uint256 - index of the ERC721 license token
     * @return uint256 - amount of usages left for this license
     */
    function _useLicense(uint256 license) internal returns (uint256) {
        usages[license] = usages[license].sub(1, "The license has no usages left.");
        return usages[license];
    }

    /**
     * @dev Sets available usages of licenses.
     *      Amount of licenses is arbitrary. The amount can be set to 0 to disable the license.
     * @param license uint256 - index of the ERC721 license token
     * @param amount uint256 - amount of usages to set for this license
     */
    function _setUsageCount(uint256 license, uint256 amount) internal {
        usages[license] = amount;
    }
}
