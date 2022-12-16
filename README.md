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
I had been meaning to get better acquainted with git, github, IPFS, and solidity. And this seemed to be like the ideal little project to do it all at once. I'm doing it in public so others can learn too & because it's easier that trying to get some certification from somewhere :) .

But I really can't quite think of any good & practical reasons to actually turn your CV into an NFT.

## How

Elements of this are:
* Json
* IPFS
* PDF turned png
* Solidity
* Remix IDE

### Steps to getting there
1. Create your CV / Resume. 
2. Turn it into a PNG. I did my CV in Google Docs so I just used [Awesome Screenshot](https://chrome.google.com/webstore/detail/awesome-screenshot-and-sc/nlipoenfbbikpbjkfpfillcgkoblgpmj) to do a "full page" screenshot.
3. Upload that PNG to IPFS. 
* https://docs.ipfs.tech/basics/desktop-app/#share-files . That's the "dumb and easy" way. I highly recommend it.
* make sure you "pin" the file so that it stays on your node.
* For the purpouses of this little experiment, it's sufficient. If you want to be really sure that the content on IPFS is always available, it might be better to run it from an always-on server you own, because there is no guarantee that IPFS nodes will keep hosting your image & Json forever. I've setup an Ubuntu Server on a Raspberry-Pi 4 and setup an IPFS node there and pinned the same files (using CID) to it. It works ok, eventhough IPFS CLI is a little confusing to me.


## Resources I read for putting this all together

The list isn't comprehensive and I likely Googled around a little more, but I tried saving what actually proved useful and, so, that's likely it.

* https://www.leewayhertz.com/create-erc-721-token/
* https://blog.0x3.studio/a-very-simple-smart-contract-for-your-nft-collection/
* https://levelup.gitconnected.com/create-nfts-with-openzeppelin-erc721-smart-contract-d4a64324ad47
* https://docs.opensea.io/docs/metadata-standards
* https://blog.logrocket.com/how-to-create-nfts-with-javascript/
* https://www.freecodecamp.org/news/how-to-make-an-nft/
* https://medium.com/@kaishinaw/creating-truly-decentralised-nfts-a-comprehensive-guide-to-erc721-ipfs-b2ae60e312b6
* https://docs.openzeppelin.com/contracts/4.x/wizard
* https://docs.ipfs.tech/basics/desktop-app/#install-ipfs-desktop

