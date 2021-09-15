pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract WECToken is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("WealthyWayCertificate", "WEC") {}

    mapping(uint256 => string) tokenURIs;

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        return tokenURIs[tokenId];
    }

    function create(address trainee, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newCertificateId = _tokenIds.current();
        _mint(trainee, newCertificateId);
        tokenURIs[newCertificateId] = tokenURI;

        return newCertificateId;
    }
}
