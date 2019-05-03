<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.3.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Lolin">
<packages>
<package name="LOLINV3">
<pad name="3" x="24.03" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="VIN" x="46.99" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="TX" x="41.91" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="RX" x="39.37" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D8" x="36.83" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D7" x="34.29" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D6" x="31.75" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D5" x="29.21" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="GND" x="26.67" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="3V" x="46.99" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D4" x="21.59" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D2" x="16.51" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="GND3" x="34.29" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D1" x="13.97" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D0" x="11.43" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="A0" x="11.43" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="RST" x="41.91" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="EN" x="39.37" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="3V3" x="36.83" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="GND1" x="44.45" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<pad name="SK" x="31.75" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="SO" x="29.21" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="SC" x="26.67" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="S1" x="24.13" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="S2" x="21.59" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="S3" x="19.05" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="VV" x="16.51" y="1.27" drill="0.8" diameter="1.778" shape="square" rot="R90"/>
<pad name="GND2" x="44.45" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<wire x1="0" y1="0" x2="58" y2="0" width="0.127" layer="21"/>
<wire x1="58" y1="0" x2="58" y2="29.5" width="0.127" layer="21"/>
<wire x1="58" y1="29.5" x2="0" y2="29.5" width="0.127" layer="21"/>
<wire x1="0" y1="29.5" x2="0" y2="24" width="0.127" layer="21"/>
<hole x="56.5" y="28" drill="2.8"/>
<hole x="56.5" y="1.5" drill="2.8"/>
<hole x="1.5" y="1.5" drill="2.8"/>
<hole x="1.5" y="28" drill="2.8"/>
<wire x1="0" y1="24" x2="0" y2="7" width="0.127" layer="21"/>
<wire x1="0" y1="7" x2="0" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="24" x2="25" y2="24" width="0.127" layer="21"/>
<wire x1="25" y1="24" x2="25" y2="7" width="0.127" layer="21"/>
<wire x1="25" y1="7" x2="0" y2="7" width="0.127" layer="21"/>
<wire x1="9" y1="22" x2="9" y2="10" width="0.6096" layer="21"/>
<wire x1="9" y1="10" x2="9" y2="9" width="0.6096" layer="21"/>
<wire x1="9" y1="9" x2="23.746" y2="9" width="0.6096" layer="21"/>
<wire x1="23.746" y1="9" x2="24" y2="9.254" width="0.6096" layer="21" curve="90"/>
<wire x1="24" y1="9.254" x2="24" y2="22" width="0.6096" layer="21"/>
<wire x1="24" y1="22" x2="9" y2="22" width="0.6096" layer="21"/>
<wire x1="1" y1="22" x2="1" y2="16" width="0.6096" layer="21"/>
<wire x1="1" y1="16" x2="5" y2="16" width="0.6096" layer="21"/>
<wire x1="5" y1="16" x2="5" y2="15" width="0.6096" layer="21"/>
<wire x1="5" y1="15" x2="1" y2="15" width="0.6096" layer="21"/>
<wire x1="1" y1="15" x2="1" y2="14" width="0.6096" layer="21"/>
<wire x1="1" y1="14" x2="5" y2="14" width="0.6096" layer="21"/>
<wire x1="5" y1="14" x2="5" y2="13" width="0.6096" layer="21"/>
<wire x1="5" y1="13" x2="1" y2="13" width="0.6096" layer="21"/>
<wire x1="1" y1="13" x2="1" y2="12" width="0.6096" layer="21"/>
<wire x1="1" y1="12" x2="5" y2="12" width="0.6096" layer="21"/>
<wire x1="5" y1="12" x2="5" y2="11" width="0.6096" layer="21"/>
<wire x1="5" y1="11" x2="1" y2="11" width="0.6096" layer="21"/>
<wire x1="1" y1="11" x2="1" y2="10" width="0.6096" layer="21"/>
<wire x1="1" y1="10" x2="6.746" y2="10" width="0.6096" layer="21"/>
<wire x1="6.746" y1="10" x2="7" y2="10.254" width="0.6096" layer="21" curve="90"/>
<wire x1="7" y1="10.254" x2="7" y2="18" width="0.6096" layer="21"/>
<wire x1="7" y1="10" x2="9" y2="10" width="0.6096" layer="21"/>
<text x="17" y="18" size="1.4224" layer="21" ratio="30">WIFI</text>
<pad name="GND4" x="13.97" y="1.27" drill="0.8" diameter="1.778" shape="square"/>
<pad name="D3" x="19.05" y="27.94" drill="0.8" diameter="1.778" shape="square"/>
<wire x1="58.42" y1="20.32" x2="52.324" y2="20.32" width="0.3048" layer="21"/>
<wire x1="52.07" y1="20.066" x2="52.07" y2="10.16" width="0.3048" layer="21"/>
<wire x1="52.07" y1="10.16" x2="58.42" y2="10.16" width="0.3048" layer="21"/>
<wire x1="58.42" y1="10.16" x2="58.42" y2="20.32" width="0.3048" layer="21"/>
<circle x="53.34" y="23.63" radius="1.27" width="0.127" layer="21"/>
<circle x="53.34" y="6.85" radius="1.27" width="0.127" layer="21"/>
<wire x1="55.88" y1="8.12" x2="50.8" y2="8.12" width="0.127" layer="21"/>
<wire x1="50.8" y1="8.12" x2="50.8" y2="5.58" width="0.127" layer="21"/>
<wire x1="50.8" y1="5.58" x2="55.88" y2="5.58" width="0.127" layer="21"/>
<wire x1="55.88" y1="5.58" x2="55.88" y2="8.12" width="0.127" layer="21"/>
<wire x1="55.88" y1="22.36" x2="50.8" y2="22.36" width="0.127" layer="21"/>
<wire x1="50.8" y1="22.36" x2="50.8" y2="24.9" width="0.127" layer="21"/>
<wire x1="50.8" y1="24.9" x2="55.88" y2="24.9" width="0.127" layer="21"/>
<wire x1="55.88" y1="24.9" x2="55.88" y2="22.36" width="0.127" layer="21"/>
<text x="30.48" y="13.97" size="1.6764" layer="21" ratio="13">NodeMcu V.3</text>
<text x="10.66" y="25.4" size="1.016" layer="21" ratio="13">D0</text>
<text x="13.2" y="25.4" size="1.016" layer="21" ratio="13">D1</text>
<text x="15.74" y="25.4" size="1.016" layer="21" ratio="13">D2</text>
<text x="18.28" y="25.4" size="1.016" layer="21" ratio="13">D3</text>
<text x="20.82" y="25.4" size="1.016" layer="21" ratio="13">D4</text>
<text x="23.36" y="25.4" size="1.016" layer="21" ratio="13">3V</text>
<text x="25.9" y="25.4" size="1.016" layer="21" ratio="13">G</text>
<text x="28.44" y="25.4" size="1.016" layer="21" ratio="13">D5</text>
<text x="30.98" y="25.4" size="1.016" layer="21" ratio="13">D6</text>
<text x="33.52" y="25.4" size="1.016" layer="21" ratio="13">D7</text>
<text x="36.06" y="25.4" size="1.016" layer="21" ratio="13">D8</text>
<text x="38.6" y="25.4" size="1.016" layer="21" ratio="13">RX</text>
<text x="41.14" y="25.4" size="1.016" layer="21" ratio="13">TX</text>
<text x="43.68" y="25.4" size="1.016" layer="21" ratio="13">G</text>
<text x="46.22" y="25.4" size="1.016" layer="21" ratio="13">3V</text>
<text x="43.68" y="2.81" size="1.016" layer="21" ratio="13">G</text>
<text x="46.22" y="2.81" size="1.016" layer="21" ratio="13">VIN</text>
<text x="41.91" y="2.81" size="1.016" layer="21" ratio="13" rot="R90">RST</text>
<text x="39.37" y="2.81" size="1.016" layer="21" ratio="13" rot="R90">EN</text>
<text x="36.83" y="2.81" size="1.016" layer="21" ratio="13" rot="R90">3V</text>
<text x="33.52" y="2.81" size="1.016" layer="21" ratio="13">G</text>
<text x="30.98" y="2.81" size="1.016" layer="21" ratio="13">SK</text>
<text x="27.94" y="2.81" size="1.016" layer="21" ratio="13"> SO</text>
<text x="25.9" y="2.81" size="1.016" layer="21" ratio="13">SC</text>
<text x="23.36" y="2.81" size="1.016" layer="21" ratio="13">S1</text>
<text x="20.82" y="2.81" size="1.016" layer="21" ratio="13">S2</text>
<text x="18.28" y="2.81" size="1.016" layer="21" ratio="13">S3</text>
<text x="15.74" y="2.81" size="1.016" layer="21" ratio="13">VV</text>
<text x="13.2" y="2.81" size="1.016" layer="21" ratio="13">G</text>
<text x="10.16" y="2.81" size="1.016" layer="21" ratio="13">A0</text>
<polygon width="0.127" layer="21">
<vertex x="52.07" y="20.32"/>
<vertex x="58.42" y="20.32"/>
<vertex x="58.42" y="10.16"/>
<vertex x="52.07" y="10.16"/>
</polygon>
<text x="30.5" y="11.5" size="1.27" layer="21">lolin</text>
<text x="10.5" y="15.5" size="1.27" layer="21">ESP8266MOD</text>
</package>
</packages>
<symbols>
<symbol name="LOLIL">
<wire x1="-35.56" y1="-10.16" x2="40.64" y2="-10.16" width="0.254" layer="94"/>
<wire x1="40.64" y1="-10.16" x2="40.64" y2="12.7" width="0.254" layer="94"/>
<wire x1="40.64" y1="12.7" x2="-35.56" y2="12.7" width="0.254" layer="94"/>
<wire x1="-35.56" y1="12.7" x2="-35.56" y2="-10.16" width="0.254" layer="94"/>
<pin name="D0" x="-33.02" y="17.78" length="middle" rot="R270"/>
<pin name="D1" x="-27.94" y="17.78" length="middle" rot="R270"/>
<pin name="D2" x="-22.86" y="17.78" length="middle" rot="R270"/>
<pin name="D3" x="-17.78" y="17.78" length="middle" rot="R270"/>
<pin name="D4" x="-12.7" y="17.78" length="middle" rot="R270"/>
<pin name="3V" x="-7.62" y="17.78" length="middle" rot="R270"/>
<pin name="GND" x="-2.54" y="17.78" length="middle" rot="R270"/>
<pin name="D5" x="2.54" y="17.78" length="middle" rot="R270"/>
<pin name="D6" x="7.62" y="17.78" length="middle" rot="R270"/>
<pin name="D7" x="12.7" y="17.78" length="middle" rot="R270"/>
<pin name="D8" x="17.78" y="17.78" length="middle" rot="R270"/>
<pin name="RX" x="22.86" y="17.78" length="middle" rot="R270"/>
<pin name="TX" x="27.94" y="17.78" length="middle" rot="R270"/>
<pin name="GND1" x="33.02" y="17.78" length="middle" rot="R270"/>
<pin name="3V3" x="38.1" y="17.78" length="middle" rot="R270"/>
<pin name="VIN" x="38.1" y="-15.24" length="middle" rot="R90"/>
<pin name="GND2" x="33.02" y="-15.24" length="middle" rot="R90"/>
<pin name="RST" x="27.94" y="-15.24" length="middle" rot="R90"/>
<pin name="EN" x="22.86" y="-15.24" length="middle" rot="R90"/>
<pin name="3V1" x="17.78" y="-15.24" length="middle" rot="R90"/>
<pin name="GND3" x="12.7" y="-15.24" length="middle" rot="R90"/>
<pin name="SK" x="7.62" y="-15.24" length="middle" rot="R90"/>
<pin name="SO" x="2.54" y="-15.24" length="middle" rot="R90"/>
<pin name="SC" x="-2.54" y="-15.24" length="middle" rot="R90"/>
<pin name="S1" x="-7.62" y="-15.24" length="middle" rot="R90"/>
<pin name="S2" x="-12.7" y="-15.24" length="middle" rot="R90"/>
<pin name="S3" x="-17.78" y="-15.24" length="middle" rot="R90"/>
<pin name="VV" x="-22.86" y="-15.24" length="middle" rot="R90"/>
<pin name="GND4" x="-27.94" y="-15.24" length="middle" rot="R90"/>
<pin name="A0" x="-33.02" y="-15.24" length="middle" rot="R90"/>
<text x="-12.7" y="0" size="1.778" layer="94" ratio="13">LOLIN V.3</text>
<text x="7.62" y="0" size="1.778" layer="94" ratio="13">NODEMCU</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="LOLINV3" prefix="IC" uservalue="yes">
<gates>
<gate name="NODEMCU-LOLINV.3" symbol="LOLIL" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LOLINV3">
<connects>
<connect gate="NODEMCU-LOLINV.3" pin="3V" pad="3"/>
<connect gate="NODEMCU-LOLINV.3" pin="3V1" pad="3V"/>
<connect gate="NODEMCU-LOLINV.3" pin="3V3" pad="3V3"/>
<connect gate="NODEMCU-LOLINV.3" pin="A0" pad="A0"/>
<connect gate="NODEMCU-LOLINV.3" pin="D0" pad="D0"/>
<connect gate="NODEMCU-LOLINV.3" pin="D1" pad="D1"/>
<connect gate="NODEMCU-LOLINV.3" pin="D2" pad="D2"/>
<connect gate="NODEMCU-LOLINV.3" pin="D3" pad="D3"/>
<connect gate="NODEMCU-LOLINV.3" pin="D4" pad="D4"/>
<connect gate="NODEMCU-LOLINV.3" pin="D5" pad="D5"/>
<connect gate="NODEMCU-LOLINV.3" pin="D6" pad="D6"/>
<connect gate="NODEMCU-LOLINV.3" pin="D7" pad="D7"/>
<connect gate="NODEMCU-LOLINV.3" pin="D8" pad="D8"/>
<connect gate="NODEMCU-LOLINV.3" pin="EN" pad="EN"/>
<connect gate="NODEMCU-LOLINV.3" pin="GND" pad="GND"/>
<connect gate="NODEMCU-LOLINV.3" pin="GND1" pad="GND1"/>
<connect gate="NODEMCU-LOLINV.3" pin="GND2" pad="GND2"/>
<connect gate="NODEMCU-LOLINV.3" pin="GND3" pad="GND3"/>
<connect gate="NODEMCU-LOLINV.3" pin="GND4" pad="GND4"/>
<connect gate="NODEMCU-LOLINV.3" pin="RST" pad="RST"/>
<connect gate="NODEMCU-LOLINV.3" pin="RX" pad="RX"/>
<connect gate="NODEMCU-LOLINV.3" pin="S1" pad="S1"/>
<connect gate="NODEMCU-LOLINV.3" pin="S2" pad="S2"/>
<connect gate="NODEMCU-LOLINV.3" pin="S3" pad="S3"/>
<connect gate="NODEMCU-LOLINV.3" pin="SC" pad="SC"/>
<connect gate="NODEMCU-LOLINV.3" pin="SK" pad="SK"/>
<connect gate="NODEMCU-LOLINV.3" pin="SO" pad="SO"/>
<connect gate="NODEMCU-LOLINV.3" pin="TX" pad="TX"/>
<connect gate="NODEMCU-LOLINV.3" pin="VIN" pad="VIN"/>
<connect gate="NODEMCU-LOLINV.3" pin="VV" pad="VV"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2" urn="urn:adsk.eagle:library:372">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26990/1" library_version="2">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:27037/1" prefix="SUPPLY" library_version="2">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC" urn="urn:adsk.eagle:symbol:26928/1" library_version="1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" urn="urn:adsk.eagle:component:26957/1" prefix="P+" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X01" urn="urn:adsk.eagle:footprint:22382/1" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" shape="octagon"/>
<text x="-1.3462" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="1X01" urn="urn:adsk.eagle:package:22485/2" type="model" library_version="3">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X01"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD1" urn="urn:adsk.eagle:symbol:22381/1" library_version="3">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="-6.35" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="2.54" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X1" urn="urn:adsk.eagle:component:22540/2" prefix="JP" uservalue="yes" library_version="3">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X01">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22485/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="Lolin" deviceset="LOLINV3" device=""/>
<part name="SUPPLY1" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="P+1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device=""/>
<part name="VCC" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="GND" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="3" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
<part name="4" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X1" device="" package3d_urn="urn:adsk.eagle:package:22485/2"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="22.86" y="93.98" size="1.778" layer="91">ULN2003 POWER_IN</text>
<text x="124.46" y="91.44" size="1.778" layer="91">ULN2003 INPUT_IN</text>
<text x="12.7" y="12.7" size="1.778" layer="91">4 AA BATTERY HOLDER</text>
</plain>
<instances>
<instance part="IC1" gate="NODEMCU-LOLINV.3" x="91.44" y="58.42" smashed="yes" rot="R270"/>
<instance part="SUPPLY1" gate="GND" x="25.4" y="25.4" smashed="yes" rot="R270">
<attribute name="VALUE" x="22.225" y="27.305" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="P+1" gate="VCC" x="25.4" y="20.32" smashed="yes" rot="R90">
<attribute name="VALUE" x="27.94" y="17.78" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="VCC" gate="G$1" x="30.48" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="27.305" y="87.63" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="35.56" y="85.09" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND" gate="G$1" x="35.56" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="38.735" y="92.71" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="40.64" y="85.09" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="1" gate="G$1" x="137.16" y="86.36" smashed="yes">
<attribute name="NAME" x="140.97" y="86.995" size="1.778" layer="95"/>
<attribute name="VALUE" x="130.81" y="81.28" size="1.778" layer="96"/>
</instance>
<instance part="2" gate="G$1" x="137.16" y="81.28" smashed="yes">
<attribute name="NAME" x="140.97" y="81.915" size="1.778" layer="95"/>
<attribute name="VALUE" x="130.81" y="76.2" size="1.778" layer="96"/>
</instance>
<instance part="3" gate="G$1" x="137.16" y="76.2" smashed="yes">
<attribute name="NAME" x="140.97" y="76.835" size="1.778" layer="95"/>
<attribute name="VALUE" x="130.81" y="71.12" size="1.778" layer="96"/>
</instance>
<instance part="4" gate="G$1" x="137.16" y="71.12" smashed="yes">
<attribute name="NAME" x="140.97" y="71.755" size="1.778" layer="95"/>
<attribute name="VALUE" x="130.81" y="66.04" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="P+1" gate="VCC" pin="VCC"/>
<pinref part="IC1" gate="NODEMCU-LOLINV.3" pin="VIN"/>
<wire x1="27.94" y1="20.32" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
<pinref part="VCC" gate="G$1" pin="1"/>
<wire x1="30.48" y1="20.32" x2="76.2" y2="20.32" width="0.1524" layer="91"/>
<wire x1="30.48" y1="88.9" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
<junction x="30.48" y="20.32"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="SUPPLY1" gate="GND" pin="GND"/>
<pinref part="IC1" gate="NODEMCU-LOLINV.3" pin="GND2"/>
<wire x1="27.94" y1="25.4" x2="35.56" y2="25.4" width="0.1524" layer="91"/>
<pinref part="GND" gate="G$1" pin="1"/>
<wire x1="35.56" y1="25.4" x2="76.2" y2="25.4" width="0.1524" layer="91"/>
<wire x1="35.56" y1="88.9" x2="35.56" y2="25.4" width="0.1524" layer="91"/>
<junction x="35.56" y="25.4"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="IC1" gate="NODEMCU-LOLINV.3" pin="D1"/>
<pinref part="1" gate="G$1" pin="1"/>
<wire x1="109.22" y1="86.36" x2="134.62" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="NODEMCU-LOLINV.3" pin="D2"/>
<pinref part="2" gate="G$1" pin="1"/>
<wire x1="109.22" y1="81.28" x2="134.62" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="NODEMCU-LOLINV.3" pin="D5"/>
<wire x1="109.22" y1="55.88" x2="116.84" y2="55.88" width="0.1524" layer="91"/>
<wire x1="116.84" y1="55.88" x2="116.84" y2="76.2" width="0.1524" layer="91"/>
<pinref part="3" gate="G$1" pin="1"/>
<wire x1="116.84" y1="76.2" x2="134.62" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="NODEMCU-LOLINV.3" pin="D6"/>
<wire x1="109.22" y1="50.8" x2="121.92" y2="50.8" width="0.1524" layer="91"/>
<wire x1="121.92" y1="50.8" x2="121.92" y2="71.12" width="0.1524" layer="91"/>
<pinref part="4" gate="G$1" pin="1"/>
<wire x1="121.92" y1="71.12" x2="134.62" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
