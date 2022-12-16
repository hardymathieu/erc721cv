# erc721cv
A collection of personal resumes to track evolution over time, minted on Ethereum.

## What

Create an NFT collection that will allow you  -and only you- to mint a new NFT (part of a collection) everytime there is an update to your CV. 

NFT standard is used because each CV iteration is unique. But it's in a collection because they are all related.

The NFT is really a pointer to a JSON file on IPFS.
That JSON is formatted according to OpenSea's standards so it shows up in a somewhat visually pleasant way there on top of displaying the picture (also on IPFS).
* It has a Title, name, External URL, description, and image.
* Then it also has "attributes", which are what [OpenSea](https://docs.opensea.io/docs/metadata-standards) uses for displaying things interestingly. 

It's here: https://ipfs.io/ipfs/QmaHgJuTvNevmkDYosQ5iDLoiPNzpVuPJ1zAovcmuEtsDQ

## Why?
Mostly to learn, and because it's fun, and because it's timely.
I had been meaning to get better acquainted with git, github, IPFS, and solidity. And this seemed to be like the ideal little project to do it all at once.

But I really can't quite think of any good & practical reasons to actually turn your CV into an NFT.

## How

Elements of this are:
* Json
* IPFS
* PDF turned png
* Solidity
* Remix IDE

