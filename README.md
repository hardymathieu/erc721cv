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
* PDF turned png
* IPFS
* Solidity
* Remix IDE

### Steps to getting there

#### 1. Create your CV / Resume. 
#### 2. Turn it into a PNG. 
I did my CV in Google Docs so I just used [Awesome Screenshot](https://chrome.google.com/webstore/detail/awesome-screenshot-and-sc/nlipoenfbbikpbjkfpfillcgkoblgpmj) to do a "full page" screenshot.
#### 3. Upload that PNG to IPFS. 
* https://docs.ipfs.tech/basics/desktop-app/#share-files . That's the "dumb and easy" way. I highly recommend it.
* make sure you "pin" the file so that it stays on your node.
* For the purpouses of this little experiment, it's sufficient. If you want to be really sure that the content on IPFS is always available, it might be better to run it from an always-on server you own, because there is no guarantee that IPFS nodes will keep hosting your image & Json forever and you probably don't keep your pc on at all times. I've setup an Ubuntu Server on a Raspberry-Pi 4 and setup an IPFS node there and pinned the same files (using CID) to it. It works ok, eventhough IPFS CLI is a little confusing to me.
* Alternatively, you can pay a little to Arweave so that your content is hosted forever. I didn't feel it very necessary for my CV data to be *that* permanent. But it's nice to know it exists.

#### 4. Create your JSON file. 
This is the core of the NFT as that's where all the data is going to be. 
* I could have put the data in the NFT directly, but then transaction/minting fees on ETH get ridiculous. Because of this no one does it, and I couldn't easily find tutorials to set it up. So, between little information & high gas fees, I chose the easy way: JSON on IPFS.
* the JSON for the first CV mint is here: https://ipfs.io/ipfs/QmaHgJuTvNevmkDYosQ5iDLoiPNzpVuPJ1zAovcmuEtsDQ
* Each mint will have a new JSON, since the idea is to mint a new NFT everytime I update my CV. As you'll see in the contract below, the/an IPFS CID needs to be given to the contract for each mint.
* All you need to create a JSON file is a text editor. Just make sure it's formatted correctly. You can easily do so here: https://jsonlint.com/. 
* It's not super easy to understand how OpenSea is going to interpret that data so it took me a couple of tries before I was happy with it. Those tries were done on Goerli since that's the testnet which OpenSea supports, more on that later. 
* Put the JSON file on IPFS too, and pin it.

*You now have a JSON File on ipfs that describes your collection & links to an image of your CV on IPFS & everything else which you felt interesting to add. Time to actually mint it.*

#### 5. You're going to need to write the smart contract 
it's what will mint your CV as an ERC721. The contract I have cobbled together is in the repo as "erc721cv.sol". It's not rocket science, it's not very long, and extensively uses the OpenZeppelin libraries to make it (1) very standard (2) very easy.

#### 6. That contract then needs to be put on chain. 
The easiest way I have found to do this is by using the [Remix online IDE](https://remix.ethereum.org/). It's not something that's advertised by professionals who would prefer to use HardHat, but for the hobbyist who isn't looking to install a whole bunch of new software and sign up for accounts with Alchemy et al., I find it's super convenient. And the contract is so small and standard, I didn't feel like running a whole bunch of automated tests on it (although that's good practice). 
It's also super easy to test your contract in Remix as you can deploy it on a "local" blockchain without needing to setup anything at all, and then deploy it on testnets with very little setup, and finally on mainnet with the same very little setup.

[This is roughly what I followed for using Remix.](https://levelup.gitconnected.com/create-nfts-with-openzeppelin-erc721-smart-contract-d4a64324ad47) [and a little of this too](https://luckytrader.com/articles/simple-erc721)

The difference with the above is that, in order to get comfortable and understand what's going on, when "deploying and running transactions" I didn't use "Injected Provider" the first time. I used the "Remix VM". That's a virtual machine that's like Ethereum but temporarily running in your browser. Feel free to deploy there 20 times just to get a feel for it. It doesn't even require Metamask.

I then moved on to using Metamask connected to Goerli so I coudl see what my NFT looked like on the testnet used by OpenSea. I had to mint it 4 times to actually get it right. The minting always went well but the JSON needed tweaking -- https://testnets.opensea.io/collection/hardymathieuresume

What you need to give the function to mint the NFT correctly is "address of the wallet that deployed the contract, IPFS CID".
So, for example: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, QmaHgJuTvNevmkDYosQ5iDLoiPNzpVuPJ1zAovcmuEtsDQ

Here it is actually visible in Remix. Once you have put that in the filed, just hit the orange button "MintMyNewHLCV" on the left, that will mint.
![image](https://user-images.githubusercontent.com/1762858/208080314-28246650-931f-4dc8-9181-37e3902a1034.png)

( Getting Goerli ETH is surprisingly hard these days. This PoW faucet might help: https://goerli-faucet.pk910.de/ )

**and that's it. You now have minted an NFT on the Goerli Testnet. Now get some ETH and repeat the same steps while connected to ETH mainnet in Metamask & you'll mint there instead.**


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
* https://luckytrader.com/articles/simple-erc721

