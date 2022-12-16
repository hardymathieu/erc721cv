// First let’s declare what the license is, in a nice machine readable way. 
// SPDX-License-Identifier: Unlicense
// Then we can move on to declaring the version of Solidity that should be used, just so there’s no confusion
 
pragma solidity ^0.8.9;
 
// Importing OpenZeppeling libraries that seemed useful
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
 
// Starting the actual contract, giving it a relevant name 
contract HardyMathieuCv is ERC721URIStorage, Ownable {
    
    // counters is to count the # of iterations of mints
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
 
    // Base URI is required to interact with IPFS
    string private _baseURIExtended;
 
    // this si going to build the ERC721 according to standards. A name and a ticker are required
    constructor() ERC721("hardymathieuresume", "HMcv") {  
        _setBaseURI("ipfs://");
    }
 
    // this sets a base URI for the collection, which, in this case, is just ipfs://
    function _setBaseURI(string memory baseURI) private {
        _baseURIExtended = baseURI;
    }
 
    // Overrides the default function to enable ERC721URIStorage to get the updated baseURI
    function _baseURI() internal view override returns (string memory) {
        return _baseURIExtended;
    }
 
    // Function which will actually allow the minting of a new NFT. Give it a nice relevant name since it doesn’t matter one bit. Do note that only the address that deploys this contrat can then proceed to minting NFTS. Which is the point.
    function mintMyNewHMCV(address collector, string memory metadataURI) public onlyOwner() {
        _tokenIds.increment(); // NFT IDs start at 1
 
        uint256 tokenId = _tokenIds.current();
        _safeMint(collector, tokenId);
        _setTokenURI(tokenId, metadataURI);
 
    }
}
