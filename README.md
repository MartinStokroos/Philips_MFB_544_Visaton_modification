# Squawker and Tweeter Driver Modification for the Philips 22RH544/50R+ MFB speaker

This repository contains design information of 3D printable adapter parts to replace the original mid+high drivers from the Philips 22RH544 MFB speaker with Visaton drivers.

ORIGINAL | MODIFIED
-------- | --------
![Philips 22RH544](figures/544_original_small.jpg  "Philips 22RH544") | ![Modified 22RH544](figures/544_modified_small.jpg  "Modified 22RH544")

The following driver substitutes were selected because of the attractive price, quality and formfactor, which comes the closest to the original drivers:

* Squawker AD0211/SQ8 -> Visaton G 50 FFL dome midrange [1]
* Tweeter AD0163/TE8 -> Visaton G 20 SC dome tweeter [2].

## Why upgrading?
- The Philips AD0211/Sq8 squawker most often fails and a replacement must be found [3],[4].
- Overall improvement of the sound quality of the mid+high frequencies. 

This work is pending. A report about the test results and recommendations for modifications of the electronics is under construction. The optimal audio performance has not been reached yet...

## Design for printable parts

# ![new G50FFL baffle](figures/G50FFL_baffle_v1.png  "new G50FFL baffle_v1")

Attempt | openSCAD files | Remarks
------- | -------------- | -------
1 | G50FFL_spacer_v1.scad G20SC_spacer_v1.scad | Mid driver sticks out above the baffle causing(?) dip in the frequency reponse (~1.8kHz). Tweeter adapter does not need extra fixation holes to be drilled through the brackets. The dust cover can not be replaced. For the tweeter plate, M4 hex-nuts can be pressed into the cut-outs (print with support).
2 | G50FFL_baffle_v1.scad G20SC_spacer_v2.scad | New baffle design for the G50FFL. The dome is lowered down to the original dome position of the AD0211. The extra gasket from the G50FFL package must be used between the driver and the baffle/horn. The original G50FFL flange must be removed. The tweeter is lowered down too and mounted with a 2mm spacer ring to leave enough room for large woofer excursions. Fixation holes must be drilled in the brackets for mounting. Dust covers can be replaced. Slight frequency response problems around the mid/high crossover frequency.
Bonus | 544_capstand.scad | Capacitor mount, see pictures below. 

### Capacitor mount
BEFORE | AFTER
------ | -----
 ![before](figures/capfixation_small.jpg  "Capacitor fixation") | ![Modified](figures/capstand_small.jpg  "Capacitor stand")
 
 Recommended capacitors:
 
* 4700 μF/63V, Vishay BCcomponents, 058/059 PLL-SI series aluminium capacitors, radial snap in 35 mm. Conrad article #446251
* 680 μF/40V, Panasonic EEU-FR1J681L series, radial 12.5 mm. Conrad article #1476134


[1]: https://www.visaton.de/en/products/dome-midranges/g-50-ffl-8-ohm

[2]: https://www.visaton.de/en/products/dome-tweeters/g-20-sc-8-ohm

 [3]: https://www.mfbfreaks.com/reparatie-en-service/tips-en-trucs/reparatie-middentoner-22ah587/
 
 [4]: http://www.transistorforum.nl/forum/index.php?mode=thread&id=19335 
