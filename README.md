# CBass

BASS is an audio library (written in C and C++) developed by Un4seen Developments. See [un4seen.com](https://www.un4seen.com) for downloads, documentation, licensing terms, and a User Forum.

CBass is a Swift Package to allow the BASS library to be  easily imported into a Swift project.  It is freely available as a public repository at [github.com/Teatra11/CBass](https://www.github.com/Teatra11/CBass).

To import BASS into your Xcode project, click on "File | Add Package Dependencies...".  In the resultant pop-up window, type "github.com/Teatra11/CBass" as the repository url, and click on "Add Package".  Then type "import CBass" at the top of any class in the project using BASS library commands.

To be clear, the CBass Swift Package wrapper is open source, but the wrapper's contents (mainly the files bass.xcframework, libbass.xcframework, bass.h, bridge.c, and bridge.h) are proprietary to Un4seen Developments. Usage of these files is free for non-commercial use.  Commercial developers should contact Un4seen Developments to arrange proper licensing.  The following is taken from their web site:

## [BASS](https://www.un4seen.com/bass.html) Licensing
BASS is free for non-commercial use. If you are a non-commercial entity (eg. an individual) and you are not making any money from your product (through sales, advertising, etc) then you can use BASS in it for free. Otherwise, one of the following licences will be required.

### Shareware licence: €125
The "shareware" licence allows the usage of BASS in an unlimited number of your shareware ("try before you buy") products, which must sell for no more than €40 each. Non-shareware products are also permitted, but the product price limit is €10 in that case. The price limit can be raised by purchasing duplicate licences (for the same platform), eg. 2 licences doubles it. If you are an individual (not a corporation) making and selling your own software, this is the licence for you.

### Single Commercial licence: €950 (iOS or Android: €475)
The "single commercial" licence allows the usage of BASS in one commercial product.

### Unlimited Commercial licence: €3450
The "unlimited commercial" licence allows the usage of BASS in an unlimited number of your commercial products. This licence applies to a single site/location at which products are being developed with BASS.
note that all prices are quoted in Euros, but payment can also be made in several other currencies

These licences are on a per-platform basis. There is a 40% reduction on each additional platform (excluding the iOS/Android Single Commercial specials), eg. Win32 and macOS Shareware licences would cost €200 (125+75) instead of €250.

In all cases there are no royalties to pay and you can use future BASS updates without further cost. Reselling/sublicensing is not permitted. Your products must be end-user products, eg. not components used by other products. Please note that these licences only cover your own software, not the publishing of other's software. If you have got any questions, please [get in touch](https://www.un4seen.com/contact.php?s=BASS%20licence%20enquiry).

