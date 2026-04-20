<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="7CharVal&#xa;Risk Model" FOLDED="false" ID="ID_234296013" CREATED="1658335817072" MODIFIED="1660139031488" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties fit_to_viewport="false" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="7" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Technology" POSITION="right" ID="ID_667702895" CREATED="1660139107687" MODIFIED="1660139114857">
<edge COLOR="#ff0000"/>
<node TEXT="Old app, possible Cross-browser risks due to HTML and JS Combination" ID="ID_100405648" CREATED="1660139115367" MODIFIED="1660139148602"/>
<node TEXT="JS not enabled" ID="ID_1322285038" CREATED="1660139569740" MODIFIED="1660139573325"/>
<node TEXT="any use of local storage or cookies?" ID="ID_1852708961" CREATED="1660140063900" MODIFIED="1660140070125"/>
</node>
<node TEXT="Usage" POSITION="right" ID="ID_19764837" CREATED="1660139158248" MODIFIED="1660139159800">
<edge COLOR="#0000ff"/>
<node TEXT="event triggering through [Check Input] button" ID="ID_1562591287" CREATED="1660139160503" MODIFIED="1660139490044">
<node TEXT="mouse click" ID="ID_1708319015" CREATED="1660139183112" MODIFIED="1660139195289"/>
<node TEXT="keyboard" ID="ID_54212518" CREATED="1660139184759" MODIFIED="1660139215050">
<node TEXT="space" ID="ID_825436888" CREATED="1660139215624" MODIFIED="1660139219177"/>
<node TEXT="tab" ID="ID_1675582798" CREATED="1660139219449" MODIFIED="1660139220345"/>
</node>
</node>
<node TEXT="event triggering cross browser" ID="ID_82154034" CREATED="1660139808735" MODIFIED="1660139818801">
<node TEXT="touch events on mobile?" ID="ID_1259377962" CREATED="1660139819247" MODIFIED="1660139825680"/>
<node TEXT="keyboard input on mobile" ID="ID_1030641034" CREATED="1660139826430" MODIFIED="1660139842108"/>
</node>
<node TEXT="any other event handling? e.g. on input field?" ID="ID_1132722854" CREATED="1660139982315" MODIFIED="1660139993116"/>
</node>
<node TEXT="Input" POSITION="right" ID="ID_1885270169" CREATED="1660139235304" MODIFIED="1660139238057">
<edge COLOR="#00ff00"/>
<node TEXT="Valid Range not recognised" ID="ID_302532743" CREATED="1660139242088" MODIFIED="1660139257273">
<node TEXT="length" ID="ID_363953150" CREATED="1660139374202" MODIFIED="1660139375642">
<node TEXT="7 valid chars" ID="ID_1848539205" CREATED="1660139258313" MODIFIED="1660139269898"/>
</node>
<node TEXT="content mix" ID="ID_1344710109" CREATED="1660139379931" MODIFIED="1660139382060">
<node TEXT="A[B-Y]Z" ID="ID_1846593778" CREATED="1660139272441" MODIFIED="1660139294378"/>
<node TEXT="a[b-y]z" ID="ID_799377688" CREATED="1660139294937" MODIFIED="1660139303498"/>
<node TEXT="0-9" ID="ID_1062960582" CREATED="1660139304346" MODIFIED="1660139315131"/>
<node TEXT="*" ID="ID_1773032374" CREATED="1660139315770" MODIFIED="1660139321803"/>
</node>
</node>
<node TEXT="Invalid Range not reported as invalid" ID="ID_392999679" CREATED="1660139323449" MODIFIED="1660139332283">
<node TEXT="length" ID="ID_1311020659" CREATED="1660139360953" MODIFIED="1660139362555">
<node TEXT="8 chars" ID="ID_235363114" CREATED="1660139346842" MODIFIED="1660139352954"/>
<node TEXT="1 - 6 chars" ID="ID_685763344" CREATED="1660139335418" MODIFIED="1660139346347"/>
<node TEXT="empty" ID="ID_128005218" CREATED="1660139332746" MODIFIED="1660139335115"/>
</node>
<node TEXT="content" ID="ID_1279589321" CREATED="1660139399034" MODIFIED="1660139400635">
<node TEXT="outside range based on ascii table values" ID="ID_539936947" CREATED="1660139411707" MODIFIED="1660139427499"/>
<node TEXT="large content" ID="ID_210043738" CREATED="1660139603372" MODIFIED="1660139608368"/>
<node TEXT="injection if server side processing" ID="ID_1272120929" CREATED="1660139608860" MODIFIED="1660139621934"/>
<node TEXT="unicode outside normal ascii range" ID="ID_1171224848" CREATED="1660139638957" MODIFIED="1660139645646"/>
<node TEXT="non-printable ascii handling" ID="ID_1489923337" CREATED="1660139648414" MODIFIED="1660139657087"/>
</node>
</node>
</node>
<node TEXT="State" POSITION="right" ID="ID_784708848" CREATED="1660139665773" MODIFIED="1660139667327">
<edge COLOR="#7c0000"/>
<node TEXT="Any state dependency between input checks?" ID="ID_285836890" CREATED="1660139667565" MODIFIED="1660139687327"/>
</node>
<node TEXT="Output" POSITION="right" ID="ID_225732542" CREATED="1660139435275" MODIFIED="1660139437420">
<edge COLOR="#ff00ff"/>
<node TEXT="any output beyond &quot;Invalid Value&quot; and &quot;Valid Value&quot;?" ID="ID_353724230" CREATED="1660139869018" MODIFIED="1660139894011"/>
</node>
<node TEXT="Server Side" POSITION="right" ID="ID_152004913" CREATED="1660139541645" MODIFIED="1660139545309">
<edge COLOR="#00ffff"/>
<node TEXT="any server side calls after loading?" ID="ID_1358721914" CREATED="1660139546060" MODIFIED="1660139554162"/>
<node TEXT="js not loads" ID="ID_1166156388" CREATED="1660139554892" MODIFIED="1660139559357"/>
<node TEXT="css not loads" ID="ID_292443831" CREATED="1660139563052" MODIFIED="1660139565135"/>
</node>
<node TEXT="rendering" POSITION="right" ID="ID_1309865143" CREATED="1660139767311" MODIFIED="1660139769392">
<edge COLOR="#00007c"/>
<node TEXT="cross browser rendering of GUI" ID="ID_567577257" CREATED="1660139769647" MODIFIED="1660139777296"/>
<node TEXT="mobile rendering" ID="ID_1701115906" CREATED="1660139777519" MODIFIED="1660139782720"/>
<node TEXT="responsive rendering with CSS layout?" ID="ID_517961699" CREATED="1660139783343" MODIFIED="1660139801536"/>
</node>
</node>
</map>
