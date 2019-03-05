<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="T" />
        <signal name="E" />
        <signal name="Q" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <port polarity="Input" name="T" />
        <port polarity="Input" name="E" />
        <port polarity="Output" name="Q" />
        <blockdef name="ld">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <block symbolname="ld" name="XLXI_1">
            <attr value="0" name="INIT">
                <trait verilog="all:0 dp:1" />
                <trait vhdl="all:0 gm:1" />
                <trait valuetype="Bit" />
            </attr>
            <blockpin signalname="XLXN_4" name="D" />
            <blockpin signalname="E" name="G" />
            <blockpin signalname="Q" name="Q" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="T" name="I0" />
            <blockpin signalname="Q" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1728" y="1344" name="XLXI_1" orien="R0" />
        <branch name="T">
            <wire x2="1072" y1="1120" y2="1120" x1="1024" />
        </branch>
        <branch name="E">
            <wire x2="1728" y1="1216" y2="1216" x1="1696" />
        </branch>
        <iomarker fontsize="28" x="1696" y="1216" name="E" orien="R180" />
        <branch name="Q">
            <wire x2="2128" y1="944" y2="944" x1="1040" />
            <wire x2="2128" y1="944" y2="1088" x1="2128" />
            <wire x2="2272" y1="1088" y2="1088" x1="2128" />
            <wire x2="1040" y1="944" y2="1056" x1="1040" />
            <wire x2="1072" y1="1056" y2="1056" x1="1040" />
            <wire x2="2128" y1="1088" y2="1088" x1="2112" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1344" y1="1088" y2="1088" x1="1328" />
            <wire x2="1728" y1="1088" y2="1088" x1="1344" />
        </branch>
        <instance x="1072" y="1184" name="XLXI_2" orien="R0" />
        <iomarker fontsize="28" x="1024" y="1120" name="T" orien="R180" />
        <iomarker fontsize="28" x="2272" y="1088" name="Q" orien="R0" />
    </sheet>
</drawing>