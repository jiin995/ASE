<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q" />
        <signal name="NQ" />
        <signal name="S" />
        <signal name="R" />
        <port polarity="Output" name="Q" />
        <port polarity="Output" name="NQ" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="R" />
        <blockdef name="nor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
        </blockdef>
        <block symbolname="nor2" name="XLXI_1">
            <blockpin signalname="Q" name="I0" />
            <blockpin signalname="S" name="I1" />
            <blockpin signalname="NQ" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_2">
            <blockpin signalname="R" name="I0" />
            <blockpin signalname="NQ" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1056" y="848" name="XLXI_1" orien="R0" />
        <instance x="1056" y="1120" name="XLXI_2" orien="R0" />
        <branch name="Q">
            <wire x2="1056" y1="784" y2="784" x1="1024" />
            <wire x2="1024" y1="784" y2="864" x1="1024" />
            <wire x2="1376" y1="864" y2="864" x1="1024" />
            <wire x2="1376" y1="864" y2="1024" x1="1376" />
            <wire x2="1504" y1="1024" y2="1024" x1="1376" />
            <wire x2="1376" y1="1024" y2="1024" x1="1312" />
        </branch>
        <branch name="NQ">
            <wire x2="1360" y1="912" y2="912" x1="1024" />
            <wire x2="1024" y1="912" y2="992" x1="1024" />
            <wire x2="1056" y1="992" y2="992" x1="1024" />
            <wire x2="1360" y1="752" y2="752" x1="1312" />
            <wire x2="1360" y1="752" y2="768" x1="1360" />
            <wire x2="1360" y1="768" y2="912" x1="1360" />
            <wire x2="1488" y1="752" y2="752" x1="1360" />
        </branch>
        <branch name="S">
            <wire x2="1056" y1="720" y2="720" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1024" y="720" name="S" orien="R180" />
        <branch name="R">
            <wire x2="1056" y1="1056" y2="1056" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1024" y="1056" name="R" orien="R180" />
        <iomarker fontsize="28" x="1488" y="752" name="NQ" orien="R0" />
        <iomarker fontsize="28" x="1504" y="1024" name="Q" orien="R0" />
    </sheet>
</drawing>