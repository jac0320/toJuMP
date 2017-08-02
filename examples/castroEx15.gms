*  QCP written by GAMS Convert at 03/08/17 06:16:34
*
*  Equation counts
*      Total        E        G        L        N        X        C        B
*        152      140        0       12        0        0        0        0
*
*  Variable counts
*                   x        b        i      s1s      s2s       sc       si
*      Total     cont   binary  integer     sos1     sos2    scont     sint
*        134      134        0        0        0        0        0        0
*  FX      0        0        0        0        0        0        0        0
*
*  Nonzero counts
*      Total    const       NL      DLL
*        551      455       96        0
*
*  Solve m using QCP minimizing x134;


Variables  x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19
          ,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36
          ,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51,x52,x53
          ,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68,x69,x70
          ,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85,x86,x87
          ,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101,x102,x103
          ,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114,x115,x116
          ,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127,x128,x129
          ,x130,x131,x132,x133,x134;

Positive Variables  x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17
          ,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34
          ,x35,x36,x37,x38,x39,x40,x41,x42,x43,x44,x45,x46,x47,x48,x49,x50,x51
          ,x52,x53,x54,x55,x56,x57,x58,x59,x60,x61,x62,x63,x64,x65,x66,x67,x68
          ,x69,x70,x71,x72,x73,x74,x75,x76,x77,x78,x79,x80,x81,x82,x83,x84,x85
          ,x86,x87,x88,x89,x90,x91,x92,x93,x94,x95,x96,x97,x98,x99,x100,x101
          ,x102,x103,x104,x105,x106,x107,x108,x109,x110,x111,x112,x113,x114
          ,x115,x116,x117,x118,x119,x120,x121,x122,x123,x124,x125,x126,x127
          ,x128,x129,x130,x131,x132,x133;

Equations  e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,e17,e18,e19
          ,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32,e33,e34,e35,e36
          ,e37,e38,e39,e40,e41,e42,e43,e44,e45,e46,e47,e48,e49,e50,e51,e52,e53
          ,e54,e55,e56,e57,e58,e59,e60,e61,e62,e63,e64,e65,e66,e67,e68,e69,e70
          ,e71,e72,e73,e74,e75,e76,e77,e78,e79,e80,e81,e82,e83,e84,e85,e86,e87
          ,e88,e89,e90,e91,e92,e93,e94,e95,e96,e97,e98,e99,e100,e101,e102,e103
          ,e104,e105,e106,e107,e108,e109,e110,e111,e112,e113,e114,e115,e116
          ,e117,e118,e119,e120,e121,e122,e123,e124,e125,e126,e127,e128,e129
          ,e130,e131,e132,e133,e134,e135,e136,e137,e138,e139,e140,e141,e142
          ,e143,e144,e145,e146,e147,e148,e149,e150,e151,e152;


e1..  - x26 - x27 - x28 + x134 =E= 0;

e2..  - x10 - x16 - x17 - x18 =E= -150;

e3..  - x11 - x19 - x20 - x21 =E= -70;

e4..  - x12 - x22 - x23 - x24 =E= -900;

e5..  - x1 - x4 - x7 - x16 - x19 - x22 + x26 =E= 0;

e6..  - x2 - x5 - x8 - x17 - x20 - x23 + x27 =E= 0;

e7..  - x3 - x6 - x9 - x18 - x21 - x24 + x28 =E= 0;

e8..  - x1 - x2 - x3 - x13 + x26 =E= 0;

e9..  - x4 - x5 - x6 - x14 + x27 =E= 0;

e10..  - x7 - x8 - x9 - x15 + x28 =E= 0;

e11..  - x10 - x11 - x12 - x13 - x14 - x15 + x25 =E= 0;

e12..  - x56 - x74 - x77 - x80 =E= -1500;

e13..  - x57 - x75 - x78 - x81 =E= -30000;

e14..  - x58 - x76 - x79 - x82 =E= -52500;

e15..  - x59 - x83 - x86 - x89 =E= -7700;

e16..  - x60 - x84 - x87 - x90 =E= -9800;

e17..  - x61 - x85 - x88 - x91 =E= -7000;

e18..  - x62 - x92 - x95 - x98 =E= -90000;

e19..  - x63 - x93 - x96 - x99 =E= -22500;

e20..  - x64 - x94 - x97 - x100 =E= -81000;

e21..  - x74 + 1500*x125 =E= 0;

e22..  - x75 + 30000*x125 =E= 0;

e23..  - x76 + 52500*x125 =E= 0;

e24..  - x77 + 1500*x126 =E= 0;

e25..  - x78 + 30000*x126 =E= 0;

e26..  - x79 + 52500*x126 =E= 0;

e27..  - x80 + 1500*x127 =E= 0;

e28..  - x81 + 30000*x127 =E= 0;

e29..  - x82 + 52500*x127 =E= 0;

e30..  - x83 + 7700*x128 =E= 0;

e31..  - x84 + 9800*x128 =E= 0;

e32..  - x85 + 7000*x128 =E= 0;

e33..  - x86 + 7700*x129 =E= 0;

e34..  - x87 + 9800*x129 =E= 0;

e35..  - x88 + 7000*x129 =E= 0;

e36..  - x89 + 7700*x130 =E= 0;

e37..  - x90 + 9800*x130 =E= 0;

e38..  - x91 + 7000*x130 =E= 0;

e39..  - x92 + 90000*x131 =E= 0;

e40..  - x93 + 22500*x131 =E= 0;

e41..  - x94 + 81000*x131 =E= 0;

e42..  - x95 + 90000*x132 =E= 0;

e43..  - x96 + 22500*x132 =E= 0;

e44..  - x97 + 81000*x132 =E= 0;

e45..  - x98 + 90000*x133 =E= 0;

e46..  - x99 + 22500*x133 =E= 0;

e47..  - x100 + 81000*x133 =E= 0;

e48..  - x56 + 1500*x119 =E= 0;

e49..  - x57 + 30000*x119 =E= 0;

e50..  - x58 + 52500*x119 =E= 0;

e51..  - x59 + 7700*x120 =E= 0;

e52..  - x60 + 9800*x120 =E= 0;

e53..  - x61 + 7000*x120 =E= 0;

e54..  - x62 + 90000*x121 =E= 0;

e55..  - x63 + 22500*x121 =E= 0;

e56..  - x64 + 81000*x121 =E= 0;

e57..  - x16 + 150*x125 =E= 0;

e58..  - x17 + 150*x126 =E= 0;

e59..  - x18 + 150*x127 =E= 0;

e60..  - x19 + 70*x128 =E= 0;

e61..  - x20 + 70*x129 =E= 0;

e62..  - x21 + 70*x130 =E= 0;

e63..  - x22 + 900*x131 =E= 0;

e64..  - x23 + 900*x132 =E= 0;

e65..  - x24 + 900*x133 =E= 0;

e66..  - x10 + 150*x119 =E= 0;

e67..  - x11 + 70*x120 =E= 0;

e68..  - x12 + 900*x121 =E= 0;

e69..    x119 + x125 + x126 + x127 =E= 1;

e70..    x120 + x128 + x129 + x130 =E= 1;

e71..    x121 + x131 + x132 + x133 =E= 1;

e72..  - 145*x26 + x29 + x38 + x47 + x74 + x83 + x92 =L= 0;

e73..  - 400*x26 + x30 + x39 + x48 + x75 + x84 + x93 =L= 0;

e74..  - 200*x26 + x31 + x40 + x49 + x76 + x85 + x94 =L= 0;

e75..  - 110*x27 + x32 + x41 + x50 + x77 + x86 + x95 =L= 0;

e76..  - 90*x27 + x33 + x42 + x51 + x78 + x87 + x96 =L= 0;

e77..  - 120*x27 + x34 + x43 + x52 + x79 + x88 + x97 =L= 0;

e78..  - 90*x28 + x35 + x44 + x53 + x80 + x89 + x98 =L= 0;

e79..  - 100*x28 + x36 + x45 + x54 + x81 + x90 + x99 =L= 0;

e80..  - 300*x28 + x37 + x46 + x55 + x82 + x91 + x100 =L= 0;

e81..    0.1*x29 + 0.1*x38 + 0.1*x47 + 0.1*x74 + 0.1*x83 + 0.1*x92 - x101 =E= 0;

e82..    x30 + x39 + x48 + x75 + x84 + x93 - x102 =E= 0;

e83..    0.3*x31 + 0.3*x40 + 0.3*x49 + 0.3*x76 + 0.3*x85 + 0.3*x94 - x103 =E= 0;

e84..    0.3*x32 + 0.3*x41 + 0.3*x50 + 0.3*x77 + 0.3*x86 + 0.3*x95 - x104 =E= 0;

e85..    0.1*x33 + 0.1*x42 + 0.1*x51 + 0.1*x78 + 0.1*x87 + 0.1*x96 - x105 =E= 0;

e86..    0.6*x34 + 0.6*x43 + 0.6*x52 + 0.6*x79 + 0.6*x88 + 0.6*x97 - x106 =E= 0;

e87..    x35 + x44 + x53 + x80 + x89 + x98 - x107 =E= 0;

e88..    0.2*x36 + 0.2*x45 + 0.2*x54 + 0.2*x81 + 0.2*x90 + 0.2*x99 - x108 =E= 0;

e89..    x37 + x46 + x55 + x82 + x91 + x100 - x109 =E= 0;

e90..  - x29 - x32 - x35 - x65 + x101 =E= 0;

e91..  - x30 - x33 - x36 - x66 + x102 =E= 0;

e92..  - x31 - x34 - x37 - x67 + x103 =E= 0;

e93..  - x38 - x41 - x44 - x68 + x104 =E= 0;

e94..  - x39 - x42 - x45 - x69 + x105 =E= 0;

e95..  - x40 - x43 - x46 - x70 + x106 =E= 0;

e96..  - x47 - x50 - x53 - x71 + x107 =E= 0;

e97..  - x48 - x51 - x54 - x72 + x108 =E= 0;

e98..  - x49 - x52 - x55 - x73 + x109 =E= 0;

e99.. x101*x110 - x29 =E= 0;

e100.. x102*x110 - x30 =E= 0;

e101.. x103*x110 - x31 =E= 0;

e102.. x101*x111 - x32 =E= 0;

e103.. x102*x111 - x33 =E= 0;

e104.. x103*x111 - x34 =E= 0;

e105.. x101*x112 - x35 =E= 0;

e106.. x102*x112 - x36 =E= 0;

e107.. x103*x112 - x37 =E= 0;

e108.. x104*x113 - x38 =E= 0;

e109.. x105*x113 - x39 =E= 0;

e110.. x106*x113 - x40 =E= 0;

e111.. x104*x114 - x41 =E= 0;

e112.. x105*x114 - x42 =E= 0;

e113.. x106*x114 - x43 =E= 0;

e114.. x104*x115 - x44 =E= 0;

e115.. x105*x115 - x45 =E= 0;

e116.. x106*x115 - x46 =E= 0;

e117.. x107*x116 - x47 =E= 0;

e118.. x108*x116 - x48 =E= 0;

e119.. x109*x116 - x49 =E= 0;

e120.. x107*x117 - x50 =E= 0;

e121.. x108*x117 - x51 =E= 0;

e122.. x109*x117 - x52 =E= 0;

e123.. x107*x118 - x53 =E= 0;

e124.. x108*x118 - x54 =E= 0;

e125.. x109*x118 - x55 =E= 0;

e126.. x101*x122 - x65 =E= 0;

e127.. x102*x122 - x66 =E= 0;

e128.. x103*x122 - x67 =E= 0;

e129.. x104*x123 - x68 =E= 0;

e130.. x105*x123 - x69 =E= 0;

e131.. x106*x123 - x70 =E= 0;

e132.. x107*x124 - x71 =E= 0;

e133.. x108*x124 - x72 =E= 0;

e134.. x109*x124 - x73 =E= 0;

e135.. x26*x110 - x1 =E= 0;

e136.. x26*x111 - x2 =E= 0;

e137.. x26*x112 - x3 =E= 0;

e138.. x27*x113 - x4 =E= 0;

e139.. x27*x114 - x5 =E= 0;

e140.. x27*x115 - x6 =E= 0;

e141.. x28*x116 - x7 =E= 0;

e142.. x28*x117 - x8 =E= 0;

e143.. x28*x118 - x9 =E= 0;

e144.. x26*x122 - x13 =E= 0;

e145.. x27*x123 - x14 =E= 0;

e146.. x28*x124 - x15 =E= 0;

e147..    x110 + x111 + x112 + x122 =E= 1;

e148..    x113 + x114 + x115 + x123 =E= 1;

e149..    x116 + x117 + x118 + x124 =E= 1;

e150..  - 10*x25 + x56 + x59 + x62 + x65 + x68 + x71 =L= 0;

e151..  - 15*x25 + x57 + x60 + x63 + x66 + x69 + x72 =L= 0;

e152..  - 20*x25 + x58 + x61 + x64 + x67 + x70 + x73 =L= 0;

* set non-default bounds
x1.up = 1000000;
x2.up = 1000000;
x3.up = 1000000;
x4.up = 1000000;
x5.up = 1000000;
x6.up = 1000000;
x7.up = 1000000;
x8.up = 1000000;
x9.up = 1000000;
x10.up = 1000000;
x11.up = 1000000;
x12.up = 1000000;
x13.up = 1000000;
x14.up = 1000000;
x15.up = 1000000;
x16.up = 1000000;
x17.up = 1000000;
x18.up = 1000000;
x19.up = 1000000;
x20.up = 1000000;
x21.up = 1000000;
x22.up = 1000000;
x23.up = 1000000;
x24.up = 1000000;
x25.up = 1000000;
x26.up = 1000000;
x27.up = 1000000;
x28.up = 1000000;
x29.up = 1000000;
x30.up = 1000000;
x31.up = 1000000;
x32.up = 1000000;
x33.up = 1000000;
x34.up = 1000000;
x35.up = 1000000;
x36.up = 1000000;
x37.up = 1000000;
x38.up = 1000000;
x39.up = 1000000;
x40.up = 1000000;
x41.up = 1000000;
x42.up = 1000000;
x43.up = 1000000;
x44.up = 1000000;
x45.up = 1000000;
x46.up = 1000000;
x47.up = 1000000;
x48.up = 1000000;
x49.up = 1000000;
x50.up = 1000000;
x51.up = 1000000;
x52.up = 1000000;
x53.up = 1000000;
x54.up = 1000000;
x55.up = 1000000;
x56.up = 1000000;
x57.up = 1000000;
x58.up = 1000000;
x59.up = 1000000;
x60.up = 1000000;
x61.up = 1000000;
x62.up = 1000000;
x63.up = 1000000;
x64.up = 1000000;
x65.up = 1000000;
x66.up = 1000000;
x67.up = 1000000;
x68.up = 1000000;
x69.up = 1000000;
x70.up = 1000000;
x71.up = 1000000;
x72.up = 1000000;
x73.up = 1000000;
x74.up = 1000000;
x75.up = 1000000;
x76.up = 1000000;
x77.up = 1000000;
x78.up = 1000000;
x79.up = 1000000;
x80.up = 1000000;
x81.up = 1000000;
x82.up = 1000000;
x83.up = 1000000;
x84.up = 1000000;
x85.up = 1000000;
x86.up = 1000000;
x87.up = 1000000;
x88.up = 1000000;
x89.up = 1000000;
x90.up = 1000000;
x91.up = 1000000;
x92.up = 1000000;
x93.up = 1000000;
x94.up = 1000000;
x95.up = 1000000;
x96.up = 1000000;
x97.up = 1000000;
x98.up = 1000000;
x99.up = 1000000;
x100.up = 1000000;
x101.up = 1000000;
x102.up = 1000000;
x103.up = 1000000;
x104.up = 1000000;
x105.up = 1000000;
x106.up = 1000000;
x107.up = 1000000;
x108.up = 1000000;
x109.up = 1000000;
x110.up = 1000000;
x111.up = 1000000;
x112.up = 1000000;
x113.up = 1000000;
x114.up = 1000000;
x115.up = 1000000;
x116.up = 1000000;
x117.up = 1000000;
x118.up = 1000000;
x119.up = 1000000;
x120.up = 1000000;
x121.up = 1000000;
x122.up = 1000000;
x123.up = 1000000;
x124.up = 1000000;
x125.up = 1000000;
x126.up = 1000000;
x127.up = 1000000;
x128.up = 1000000;
x129.up = 1000000;
x130.up = 1000000;
x131.up = 1000000;
x132.up = 1000000;
x133.up = 1000000;

Model m / all /;

m.limrow=0; m.limcol=0;

m.workspace  = 500;
m.optcr      = 1E-6;
m.reslim     = 3600;
m.iterlim    = 10000000;
Solve m using QCP minimizing x134;
