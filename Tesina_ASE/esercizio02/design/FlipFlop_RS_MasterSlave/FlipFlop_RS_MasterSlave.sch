<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S" />
        <signal name="CLK" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="Q" />
        <signal name="NQ" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_27" />
        <signal name="XLXN_30" />
        <signal name="XLXN_31" />
        <signal name="XLXN_32" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="XLXN_43" />
        <signal name="XLXN_44" />
        <signal name="R" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q" />
        <port polarity="Output" name="NQ" />
        <port polarity="Input" name="R" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
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
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="CLK" name="I0" />
            <blockpin signalname="R" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="S" name="I0" />
            <blockpin signalname="CLK" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="XLXN_14" name="I0" />
            <blockpin signalname="XLXN_16" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_7">
            <blockpin signalname="Q" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="NQ" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_8">
            <blockpin signalname="XLXN_12" name="I0" />
            <blockpin signalname="NQ" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="CLK" name="I" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_5">
            <blockpin signalname="XLXN_14" name="I0" />
            <blockpin signalname="XLXN_4" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="nor2" name="XLXI_6">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_13" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="S">
            <wire x2="736" y1="1120" y2="1120" x1="704" />
        </branch>
        <branch name="CLK">
            <wire x2="608" y1="880" y2="880" x1="576" />
            <wire x2="704" y1="880" y2="880" x1="608" />
            <wire x2="704" y1="880" y2="1056" x1="704" />
            <wire x2="736" y1="1056" y2="1056" x1="704" />
            <wire x2="608" y1="880" y2="1312" x1="608" />
            <wire x2="1056" y1="1312" y2="1312" x1="608" />
            <wire x2="720" y1="688" y2="688" x1="704" />
            <wire x2="704" y1="688" y2="880" x1="704" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1216" y1="656" y2="656" x1="976" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1216" y1="1088" y2="1088" x1="992" />
        </branch>
        <instance x="1056" y="1344" name="XLXI_9" orien="R0" />
        <branch name="XLXN_12">
            <wire x2="2320" y1="1024" y2="1024" x1="2016" />
        </branch>
        <branch name="Q">
            <wire x2="2320" y1="784" y2="784" x1="2256" />
            <wire x2="2256" y1="784" y2="848" x1="2256" />
            <wire x2="2640" y1="848" y2="848" x1="2256" />
            <wire x2="2640" y1="848" y2="992" x1="2640" />
            <wire x2="2720" y1="992" y2="992" x1="2640" />
            <wire x2="2640" y1="992" y2="992" x1="2576" />
        </branch>
        <branch name="NQ">
            <wire x2="2256" y1="896" y2="960" x1="2256" />
            <wire x2="2320" y1="960" y2="960" x1="2256" />
            <wire x2="2624" y1="896" y2="896" x1="2256" />
            <wire x2="2624" y1="752" y2="752" x1="2576" />
            <wire x2="2624" y1="752" y2="896" x1="2624" />
            <wire x2="2704" y1="752" y2="752" x1="2624" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1152" y1="944" y2="1024" x1="1152" />
            <wire x2="1216" y1="1024" y2="1024" x1="1152" />
            <wire x2="1552" y1="944" y2="944" x1="1152" />
            <wire x2="1552" y1="688" y2="688" x1="1472" />
            <wire x2="1552" y1="688" y2="944" x1="1552" />
            <wire x2="1776" y1="688" y2="688" x1="1552" />
        </branch>
        <instance x="2320" y="848" name="XLXI_7" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="2048" y1="720" y2="720" x1="2032" />
            <wire x2="2320" y1="720" y2="720" x1="2048" />
        </branch>
        <instance x="720" y="752" name="XLXI_1" orien="R0" />
        <instance x="736" y="1184" name="XLXI_2" orien="R0" />
        <iomarker fontsize="28" x="704" y="1120" name="S" orien="R180" />
        <instance x="1216" y="784" name="XLXI_5" orien="R0" />
        <branch name="XLXN_14">
            <wire x2="1216" y1="720" y2="720" x1="1152" />
            <wire x2="1152" y1="720" y2="800" x1="1152" />
            <wire x2="1536" y1="800" y2="800" x1="1152" />
            <wire x2="1536" y1="800" y2="1056" x1="1536" />
            <wire x2="1760" y1="1056" y2="1056" x1="1536" />
            <wire x2="1536" y1="1056" y2="1056" x1="1472" />
        </branch>
        <instance x="1216" y="1152" name="XLXI_6" orien="R0" />
        <instance x="1760" y="1120" name="XLXI_4" orien="R0" />
        <instance x="1776" y="816" name="XLXI_3" orien="R0" />
        <branch name="XLXN_16">
            <wire x2="1632" y1="1312" y2="1312" x1="1280" />
            <wire x2="1632" y1="880" y2="1312" x1="1632" />
            <wire x2="1728" y1="880" y2="880" x1="1632" />
            <wire x2="1728" y1="880" y2="992" x1="1728" />
            <wire x2="1760" y1="992" y2="992" x1="1728" />
            <wire x2="1776" y1="752" y2="752" x1="1728" />
            <wire x2="1728" y1="752" y2="880" x1="1728" />
        </branch>
        <instance x="2320" y="1088" name="XLXI_8" orien="R0" />
        <iomarker fontsize="28" x="576" y="880" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="2704" y="752" name="NQ" orien="R0" />
        <iomarker fontsize="28" x="2720" y="992" name="Q" orien="R0" />
        <branch name="R">
            <wire x2="720" y1="624" y2="624" x1="688" />
        </branch>
        <iomarker fontsize="28" x="688" y="624" name="R" orien="R180" />
    </sheet>
</drawing>