<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <attr value="Always|BaseDashIndex" name="RenameBusIO" />
    <netlist>
        <signal name="NQ" />
        <signal name="Q" />
        <signal name="S" />
        <signal name="R" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <port polarity="Output" name="NQ" />
        <port polarity="Output" name="Q" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="R" />
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <block symbolname="nand2" name="XLXI_2">
            <blockpin signalname="NQ" name="I0" />
            <blockpin signalname="S" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_3">
            <blockpin signalname="R" name="I0" />
            <blockpin signalname="Q" name="I1" />
            <blockpin signalname="NQ" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Q">
            <wire x2="1056" y1="896" y2="976" x1="1056" />
            <wire x2="1120" y1="976" y2="976" x1="1056" />
            <wire x2="1456" y1="896" y2="896" x1="1056" />
            <wire x2="1456" y1="736" y2="736" x1="1376" />
            <wire x2="1568" y1="736" y2="736" x1="1456" />
            <wire x2="1456" y1="736" y2="896" x1="1456" />
        </branch>
        <branch name="S">
            <wire x2="1120" y1="704" y2="704" x1="1088" />
        </branch>
        <iomarker fontsize="28" x="1088" y="704" name="S" orien="R180" />
        <branch name="R">
            <wire x2="1120" y1="1040" y2="1040" x1="1088" />
        </branch>
        <iomarker fontsize="28" x="1088" y="1040" name="R" orien="R180" />
        <branch name="NQ">
            <wire x2="1120" y1="768" y2="768" x1="1056" />
            <wire x2="1056" y1="768" y2="848" x1="1056" />
            <wire x2="1440" y1="848" y2="848" x1="1056" />
            <wire x2="1440" y1="848" y2="1008" x1="1440" />
            <wire x2="1584" y1="1008" y2="1008" x1="1440" />
            <wire x2="1440" y1="1008" y2="1008" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1568" y="736" name="Q" orien="R0" />
        <iomarker fontsize="28" x="1584" y="1008" name="NQ" orien="R0" />
        <instance x="1120" y="1104" name="XLXI_3" orien="R0" />
        <instance x="1120" y="832" name="XLXI_2" orien="R0" />
    </sheet>
</drawing>