pragma solidity 0.6.8;
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import "./TieredLicense.sol";
import "./CountableLicense.sol";

contract LicenseToken is ERC721, TieredLicense, CountableLicense, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _ids;

    constructor() ERC721("License", "LIC") public {
    }

    /**
     * @dev Issue a basic license with defined parameters.
     * @param recipient address of the license recipient.
     * @param tier the tier of the license that is expected by the app (e.g. Trial, Pro).
     * @param expiration date of expiration of the license. 
     * @param usages amount of usages to set for this license.
     * @return uint256 index of the ERC721 license token.
     */
    function issueLicense(address recipient, Tiers tier, uint256 expiration, uint256 usages) public onlyOwner returns (uint256) {
        _ids.increment();
        uint256 tokenId = uint256(keccak256(abi.encodePacked(_ids.current())));
        
        _mint(recipient, tokenId);
        _setUsageCount(tokenId, usages);
        _setLicenseTier(tokenId, tier);
        _setLicenseExpiration(tokenId, now + (expiration * 1 days));
        return tokenId;
    }

    /**
     * @dev Checks if the license belongs to the caller and counts usages of licenses.
     *      This function should be called by the program if a user attempts to use their license.
     *      If the caller is not the owner of the license or there are no usages left,
     *      the function will throw an error.
     * @param license uint256 index of the ERC721 license token.
     * @return amount of usages left for this license.
     */
    function useLicense(uint256 license) public returns (uint256) {
        require(_isApprovedOrOwner(msg.sender, license), "The license does not belong to the sender.");
        return _useLicense(license);
    }
}
