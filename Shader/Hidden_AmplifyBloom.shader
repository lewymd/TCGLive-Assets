//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/AmplifyBloom" {
Properties {
_MainTex (" ", 2D) = "black" { }
_AnamorphicRTS0 (" ", 2D) = "black" { }
_AnamorphicRTS1 (" ", 2D) = "black" { }
_AnamorphicRTS2 (" ", 2D) = "black" { }
_AnamorphicRTS3 (" ", 2D) = "black" { }
_AnamorphicRTS4 (" ", 2D) = "black" { }
_AnamorphicRTS5 (" ", 2D) = "black" { }
_AnamorphicRTS6 (" ", 2D) = "black" { }
_AnamorphicRTS7 (" ", 2D) = "black" { }
_LensFlareLUT (" ", 2D) = "black" { }
}
SubShader {
 Pass {
  Name "frag_threshold"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 42674
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz + (-_BloomParams.yyy);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, _BloomRange.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_10 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_2 = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_10 = max(u_xlat16_10, u_xlat16_2);
    u_xlat16_10 = min(u_xlat16_10, 1.0);
    u_xlat16_10 = u_xlat16_10 * 255.0;
    u_xlat16_10 = ceil(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_10);
    SV_Target0.w = u_xlat16_10;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat16_0 + (-_BloomParams.yyyy);
    SV_Target0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_thresholdMask"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 120798
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = texture(_MaskTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + (-_BloomParams.yyy);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, _BloomRange.xxx);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3 = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1 + (-_BloomParams.yyyy);
    SV_Target0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_anamorphicGlare"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 187816
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_3.x = u_xlat16_2.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].x;
    u_xlat16_3.y = u_xlat16_2.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].x;
    u_xlat16_3.z = u_xlat16_2.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].x;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_2.xyz;
    u_xlat16_4.x = u_xlat16_2.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].y;
    u_xlat16_4.y = u_xlat16_2.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].y;
    u_xlat16_4.z = u_xlat16_2.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].y;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].z;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].z;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].w;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].w;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].x;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].x;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].x;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].y;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].y;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].z;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].z;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].w;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].w;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].x;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].x;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].x;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].y;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].y;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].z;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].z;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].w;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].w;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].x;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].x;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].x;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].y;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].y;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].z;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].z;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_4.x = u_xlat16_3.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].w;
    u_xlat16_4.y = u_xlat16_3.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].w;
    u_xlat16_4.z = u_xlat16_3.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_17 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_17 = max(u_xlat16_17, u_xlat16_3.x);
    u_xlat16_17 = min(u_xlat16_17, 1.0);
    u_xlat16_17 = u_xlat16_17 * 255.0;
    u_xlat16_17 = ceil(u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_17);
    SV_Target0.w = u_xlat16_17;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[4];
uniform 	mediump vec4 hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[4];
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].x;
    u_xlat16_2.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].x;
    u_xlat16_2.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].x;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].y;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].y;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat0[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].z;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].z;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[0].w;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[1].w;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat0[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].x;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].x;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].x;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].y;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].y;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat1[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].z;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].z;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[0].w;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[1].w;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat1[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].x;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].x;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].x;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].y;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].y;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat2[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].z;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].z;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[0].w;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[1].w;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat2[2].w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[0].xy;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[1].xy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].x;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].x;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].x;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].y;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].y;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].y;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xz = vs_TEXCOORD0.xx + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[0].zw;
    u_xlat0.yw = vs_TEXCOORD0.yy + hlslcc_mtx4x4_AnamorphicGlareOffsetsMat3[1].zw;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.x = u_xlat16_1.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].z;
    u_xlat16_3.y = u_xlat16_1.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].z;
    u_xlat16_3.z = u_xlat16_1.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].z;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_0.x * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[0].w;
    u_xlat16_3.y = u_xlat16_0.y * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[1].w;
    u_xlat16_3.z = u_xlat16_0.z * hlslcc_mtx4x4_AnamorphicGlareWeightsMat3[2].w;
    SV_Target0.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_lensFlare0"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 256070
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = _LensFlareHaloChrDistortion * (-_MainTex_TexelSize.x);
    u_xlat5.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat5.xy * _LensFlareGhostsParams.yy;
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 1.41419995;
    u_xlat2.x = fract(u_xlat5.x);
    u_xlat5.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xy = u_xlat5.xx * u_xlat1.xy;
    u_xlat1.xy = u_xlat5.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat5.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xw = u_xlat0.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xw = texture(_MainTex, u_xlat0.xw).xw;
    u_xlat16_3.x = u_xlat16_0.x * _BloomRange.x;
    u_xlat16_3.x = u_xlat16_0.w * u_xlat16_3.x;
    u_xlat0.x = _LensFlareHaloChrDistortion * _MainTex_TexelSize.x;
    u_xlat0.xy = u_xlat5.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xy = texture(_MainTex, u_xlat0.xy).zw;
    u_xlat16_18 = u_xlat16_0.x * _BloomRange.x;
    u_xlat16_3.z = u_xlat16_0.y * u_xlat16_18;
    u_xlat0.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_10.xy = texture(_MainTex, u_xlat10.xy).yw;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) * 1.41419995 + 1.0;
    u_xlat0.x = u_xlat0.x * _LensFlareHaloParams.z;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LensFlareHaloParams.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_18 = u_xlat16_10.x * _BloomRange.x;
    u_xlat16_3.y = u_xlat16_10.y * u_xlat16_18;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LensFlareHaloParams.xxx;
    u_xlat2.y = 0.0;
    u_xlat16_1.xyz = texture(_LensFlareLUT, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * _BloomRange.yyy;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_4 = max(u_xlat16_3.z, 9.99999997e-07);
    u_xlat16_18 = max(u_xlat16_18, u_xlat16_4);
    u_xlat16_18 = min(u_xlat16_18, 1.0);
    u_xlat16_18 = u_xlat16_18 * 255.0;
    u_xlat16_18 = ceil(u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_3.xyz / vec3(u_xlat16_18);
    SV_Target0.w = u_xlat16_18;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xx;
    u_xlat1.xy = u_xlat6.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.x) * 1.41419995 + 1.0;
    u_xlat7.x = u_xlat7.x * _LensFlareHaloParams.z;
    u_xlat7.x = log2(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _LensFlareHaloParams.w;
    u_xlat7.x = exp2(u_xlat7.x);
    u_xlat10 = _LensFlareHaloChrDistortion * (-_MainTex_TexelSize.x);
    u_xlat2.xy = u_xlat6.xy * vec2(u_xlat10) + u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = texture(_MainTex, u_xlat2.xy).x;
    u_xlat10 = _LensFlareHaloChrDistortion * _MainTex_TexelSize.x;
    u_xlat6.xy = u_xlat6.xy * vec2(u_xlat10) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.y = texture(_MainTex, u_xlat1.xy).y;
    u_xlat6.xy = u_xlat6.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.z = texture(_MainTex, u_xlat6.xy).z;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_lensFlare1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 304245
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat14.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat14.xy = u_xlat14.xy * u_xlat1.xx;
    u_xlat1.xy = u_xlat14.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat15.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
    u_xlat15.x = dot(u_xlat15.xy, u_xlat15.xy);
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = (-u_xlat15.x) * 1.41419995 + 1.0;
    u_xlat15.x = u_xlat15.x * _LensFlareHaloParams.z;
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _LensFlareHaloParams.w;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat2 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat16.xy = u_xlat14.xy * u_xlat2.zw + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_16.xy = texture(_MainTex, u_xlat16.xy).xw;
    u_xlat16_3.x = u_xlat16_16.x * _BloomRange.x;
    u_xlat16_3.x = u_xlat16_16.y * u_xlat16_3.x;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat16.xy = u_xlat14.xy * u_xlat4.zw + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.xy).yw;
    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_16.xy = texture(_MainTex, u_xlat16.xy).zw;
    u_xlat16_24 = u_xlat16_16.x * _BloomRange.x;
    u_xlat16_3.z = u_xlat16_16.y * u_xlat16_24;
    u_xlat16_24 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_3.y = u_xlat16_1.y * u_xlat16_24;
    u_xlat1.xyz = u_xlat15.xxx * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.y = 0.0;
    u_xlat16_5.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = fract(vs_TEXCOORD0.xy);
    u_xlat2.xy = u_xlat14.xy * u_xlat2.xy + u_xlat0.xy;
    u_xlat14.xy = u_xlat14.xy * u_xlat4.xy + u_xlat0.xy;
    u_xlat14.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_14.xy = texture(_MainTex, u_xlat14.xy).zw;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xy = texture(_MainTex, u_xlat2.xy).xw;
    u_xlat16_3.x = u_xlat16_2.x * _BloomRange.x;
    u_xlat16_3.x = u_xlat16_2.y * u_xlat16_3.x;
    u_xlat16_24 = u_xlat16_14.x * _BloomRange.x;
    u_xlat16_3.z = u_xlat16_14.y * u_xlat16_24;
    u_xlat14.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xy = texture(_MainTex, u_xlat0.xy).yw;
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat14.x = (-u_xlat14.x) * 1.41419995 + 1.0;
    u_xlat14.x = u_xlat14.x * _LensFlareGhostsParams.z;
    u_xlat14.x = log2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * _LensFlareGhostsParams.w;
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat16_24 = u_xlat16_0.x * _BloomRange.x;
    u_xlat16_3.y = u_xlat16_0.y * u_xlat16_24;
    u_xlat0.xyz = u_xlat14.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * _BloomRange.yyy;
    u_xlat16_24 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_6 = max(u_xlat16_3.z, 9.99999997e-07);
    u_xlat16_24 = max(u_xlat16_24, u_xlat16_6);
    u_xlat16_24 = min(u_xlat16_24, 1.0);
    u_xlat16_24 = u_xlat16_24 * 255.0;
    u_xlat16_24 = ceil(u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_3.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_24;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat1.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat10.xy = u_xlat10.xy * u_xlat1.xx;
    u_xlat1.xy = u_xlat10.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat11.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat11.x) * 1.41419995 + 1.0;
    u_xlat11.x = u_xlat11.x * _LensFlareHaloParams.z;
    u_xlat11.x = log2(u_xlat11.x);
    u_xlat11.x = u_xlat11.x * _LensFlareHaloParams.w;
    u_xlat11.x = exp2(u_xlat11.x);
    u_xlat2 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat12.xy = u_xlat10.xy * u_xlat2.zw + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_MainTex, u_xlat12.xy).x;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat12.xy = u_xlat10.xy * u_xlat4.zw + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).y;
    u_xlat1.xy = u_xlat12.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.z = texture(_MainTex, u_xlat1.xy).z;
    u_xlat1.xyz = u_xlat11.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.y = 0.0;
    u_xlat16_3.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = fract(vs_TEXCOORD0.xy);
    u_xlat2.xy = u_xlat10.xy * u_xlat2.xy + u_xlat0.xy;
    u_xlat10.xy = u_xlat10.xy * u_xlat4.xy + u_xlat0.xy;
    u_xlat10.xy = u_xlat10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.z = texture(_MainTex, u_xlat10.xy).z;
    u_xlat10.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.x = texture(_MainTex, u_xlat10.xy).x;
    u_xlat10.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.y = texture(_MainTex, u_xlat0.xy).y;
    u_xlat0.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) * 1.41419995 + 1.0;
    u_xlat0.x = u_xlat0.x * _LensFlareGhostsParams.z;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LensFlareGhostsParams.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_lensFlare2"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 346727
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
float u_xlat24;
float u_xlat25;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat16.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat1.xy = (-u_xlat16.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat9.xy = u_xlat16.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_9.xy = texture(_MainTex, u_xlat9.xy).yw;
    u_xlat16_2.x = u_xlat16_9.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_9.y * u_xlat16_2.x;
    u_xlat9.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat25 = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat9.xy = vec2(u_xlat25) * u_xlat9.xy;
    u_xlat3 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat4.xy = u_xlat9.xy * u_xlat3.xy + u_xlat16.xy;
    u_xlat4.xy = u_xlat4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xy = texture(_MainTex, u_xlat4.xy).xw;
    u_xlat16_26 = u_xlat16_4.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_4.y * u_xlat16_26;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat16.xy = u_xlat9.xy * u_xlat4.xy + u_xlat16.xy;
    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_16.xy = texture(_MainTex, u_xlat16.xy).zw;
    u_xlat16_26 = u_xlat16_16.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_16.y * u_xlat16_26;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx;
    u_xlat1.xw = fract(vs_TEXCOORD0.xy);
    u_xlat6.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat24 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = (-u_xlat24) * 1.41419995 + 1.0;
    u_xlat24 = u_xlat24 * _LensFlareGhostsParams.z;
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LensFlareGhostsParams.w;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat3.xy = u_xlat9.xy * u_xlat3.xy + u_xlat1.xw;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).xw;
    u_xlat16_2.x = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_3.y * u_xlat16_2.x;
    u_xlat3.xy = u_xlat9.xy * u_xlat4.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).yw;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat16_26 = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_3.y * u_xlat16_26;
    u_xlat16_26 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_1.w * u_xlat16_26;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx + u_xlat5.xyz;
    u_xlat1.xw = u_xlat9.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat1.xw = fract(u_xlat1.xw);
    u_xlat3.xy = u_xlat9.xy * u_xlat3.zw + u_xlat1.xw;
    u_xlat9.xy = u_xlat9.xy * u_xlat4.zw + u_xlat1.xw;
    u_xlat9.xy = u_xlat9.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_9.xy = texture(_MainTex, u_xlat9.xy).zw;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).xw;
    u_xlat16_2.x = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_3.y * u_xlat16_2.x;
    u_xlat16_26 = u_xlat16_9.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_9.y * u_xlat16_26;
    u_xlat9.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).yw;
    u_xlat24 = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = (-u_xlat24) * 1.41419995 + 1.0;
    u_xlat24 = u_xlat24 * _LensFlareHaloParams.z;
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LensFlareHaloParams.w;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_26 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_1.w * u_xlat16_26;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_0.xyz + u_xlat5.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * _BloomRange.yyy;
    u_xlat16_26 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_7 = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_7);
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_26 = u_xlat16_26 * 255.0;
    u_xlat16_26 = ceil(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_26);
    SV_Target0.w = u_xlat16_26;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat7;
vec2 u_xlat12;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat12.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat1.xy = (-u_xlat12.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat7.xy = u_xlat12.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat7.y = texture(_MainTex, u_xlat7.xy).y;
    u_xlat2.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat14.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xy = u_xlat14.xx * u_xlat2.xy;
    u_xlat3 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat14.xy = u_xlat2.xy * u_xlat3.xy + u_xlat12.xy;
    u_xlat14.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat7.x = texture(_MainTex, u_xlat14.xy).x;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat12.xy = u_xlat2.xy * u_xlat4.xy + u_xlat12.xy;
    u_xlat12.xy = u_xlat12.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat7.z = texture(_MainTex, u_xlat12.xy).z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareGhostsParams.xxx;
    u_xlat14.xy = fract(vs_TEXCOORD0.xy);
    u_xlat5.xy = (-u_xlat14.xy) + vec2(0.5, 0.5);
    u_xlat18 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat18) * 1.41419995 + 1.0;
    u_xlat18 = u_xlat18 * _LensFlareGhostsParams.z;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LensFlareGhostsParams.w;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.xy = u_xlat2.xy * u_xlat3.xy + u_xlat14.xy;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.x = texture(_MainTex, u_xlat3.xy).x;
    u_xlat3.xy = u_xlat2.xy * u_xlat4.xy + u_xlat14.xy;
    u_xlat14.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.y = texture(_MainTex, u_xlat14.xy).y;
    u_xlat14.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.z = texture(_MainTex, u_xlat14.xy).z;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat14.xy = u_xlat2.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat3.xy = u_xlat2.xy * u_xlat3.zw + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * u_xlat4.zw + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.z = texture(_MainTex, u_xlat2.xy).z;
    u_xlat2.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.x = texture(_MainTex, u_xlat2.xy).x;
    u_xlat2.xy = (-u_xlat14.xy) + vec2(0.5, 0.5);
    u_xlat14.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.y = texture(_MainTex, u_xlat14.xy).y;
    u_xlat18 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat18) * 1.41419995 + 1.0;
    u_xlat18 = u_xlat18 * _LensFlareHaloParams.z;
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LensFlareHaloParams.w;
    u_xlat18 = exp2(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_lensFlare3"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 412015
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_8;
vec2 u_xlat10;
mediump vec2 u_xlat16_10;
vec2 u_xlat18;
mediump vec2 u_xlat16_18;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
float u_xlat27;
float u_xlat28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat18.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat1.xy = (-u_xlat18.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat10.xy = u_xlat18.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_10.xy = texture(_MainTex, u_xlat10.xy).yw;
    u_xlat16_2.x = u_xlat16_10.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_10.y * u_xlat16_2.x;
    u_xlat10.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat28 = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xy = vec2(u_xlat28) * u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat21.xy = u_xlat3.xy * u_xlat4.xy + u_xlat18.xy;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).xw;
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_21.y * u_xlat16_29;
    u_xlat5 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat18.xy = u_xlat3.xy * u_xlat5.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_18.xy = texture(_MainTex, u_xlat18.xy).zw;
    u_xlat16_29 = u_xlat16_18.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_18.y * u_xlat16_29;
    u_xlat6.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx;
    u_xlat1.xw = fract(vs_TEXCOORD0.xy);
    u_xlat21.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat21.xy = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).yw;
    u_xlat16_2.x = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_21.y * u_xlat16_2.x;
    u_xlat21.xy = u_xlat3.xy * u_xlat4.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat3.xy * u_xlat5.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).zw;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).xw;
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_21.y * u_xlat16_29;
    u_xlat16_29 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_1.w * u_xlat16_29;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat7.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat1.xw = (-u_xlat10.xy) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat1.xw, u_xlat1.xw);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat1.xw = u_xlat10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).yw;
    u_xlat16_2.x = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_1.w * u_xlat16_2.x;
    u_xlat1.xw = u_xlat3.xy * u_xlat4.xy + u_xlat10.xy;
    u_xlat10.xy = u_xlat3.xy * u_xlat5.xy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_10.xy = texture(_MainTex, u_xlat10.xy).zw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).xw;
    u_xlat16_29 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat16_29;
    u_xlat16_29 = u_xlat16_10.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_10.y * u_xlat16_29;
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat21.xy = u_xlat3.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat21.xy = fract(u_xlat21.xy);
    u_xlat4.xy = u_xlat3.xy * u_xlat4.zw + u_xlat21.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat5.zw + u_xlat21.xy;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat4.xy = u_xlat4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xy = texture(_MainTex, u_xlat4.xy).xw;
    u_xlat16_2.x = u_xlat16_4.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_4.y * u_xlat16_2.x;
    u_xlat16_29 = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_3.y * u_xlat16_29;
    u_xlat3.xy = (-u_xlat21.xy) + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).yw;
    u_xlat27 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareHaloParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareHaloParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_21.y * u_xlat16_29;
    u_xlat3.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * _BloomRange.yyy;
    u_xlat16_29 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_8 = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_8);
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_29 = u_xlat16_29 * 255.0;
    u_xlat16_29 = ceil(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_29);
    SV_Target0.w = u_xlat16_29;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat8;
vec2 u_xlat14;
vec2 u_xlat16;
vec2 u_xlat19;
float u_xlat21;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat14.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat1.xy = (-u_xlat14.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat8.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.y = texture(_MainTex, u_xlat8.xy).y;
    u_xlat2.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat16.xy = u_xlat16.xx * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat3 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat4.xy = u_xlat16.xy * u_xlat3.xy + u_xlat14.xy;
    u_xlat4.xy = u_xlat4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.x = texture(_MainTex, u_xlat4.xy).x;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat14.xy = u_xlat16.xy * u_xlat4.xy + u_xlat14.xy;
    u_xlat14.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.z = texture(_MainTex, u_xlat14.xy).z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareGhostsParams.xxx;
    u_xlat5.xy = fract(vs_TEXCOORD0.xy);
    u_xlat19.xy = (-u_xlat5.xy) + vec2(0.5, 0.5);
    u_xlat21 = dot(u_xlat19.xy, u_xlat19.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat19.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.y = texture(_MainTex, u_xlat19.xy).y;
    u_xlat19.xy = u_xlat16.xy * u_xlat3.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat16.xy * u_xlat4.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.z = texture(_MainTex, u_xlat5.xy).z;
    u_xlat5.xy = u_xlat19.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.x = texture(_MainTex, u_xlat5.xy).x;
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat5.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat21 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat5.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.y = texture(_MainTex, u_xlat5.xy).y;
    u_xlat3.xy = u_xlat16.xy * u_xlat3.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat16.xy * u_xlat4.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.z = texture(_MainTex, u_xlat2.xy).z;
    u_xlat2.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).x;
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat2.xy = u_xlat16.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat3.xy = u_xlat16.xy * u_xlat3.zw + u_xlat2.xy;
    u_xlat16.xy = u_xlat16.xy * u_xlat4.zw + u_xlat2.xy;
    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.z = texture(_MainTex, u_xlat16.xy).z;
    u_xlat16.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.x = texture(_MainTex, u_xlat16.xy).x;
    u_xlat16.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).y;
    u_xlat21 = dot(u_xlat16.xy, u_xlat16.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareHaloParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareHaloParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_lensFlare4"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 464158
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_8;
vec2 u_xlat10;
mediump vec2 u_xlat16_10;
vec2 u_xlat18;
mediump vec2 u_xlat16_18;
vec2 u_xlat21;
mediump vec2 u_xlat16_21;
float u_xlat27;
float u_xlat28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat18.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat1.xy = (-u_xlat18.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat10.xy = u_xlat18.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_10.xy = texture(_MainTex, u_xlat10.xy).yw;
    u_xlat16_2.x = u_xlat16_10.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_10.y * u_xlat16_2.x;
    u_xlat10.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat28 = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xy = vec2(u_xlat28) * u_xlat10.xy;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat21.xy = u_xlat3.xy * u_xlat4.xy + u_xlat18.xy;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).xw;
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_21.y * u_xlat16_29;
    u_xlat5 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat18.xy = u_xlat3.xy * u_xlat5.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_18.xy = texture(_MainTex, u_xlat18.xy).zw;
    u_xlat16_29 = u_xlat16_18.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_18.y * u_xlat16_29;
    u_xlat6.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx;
    u_xlat1.xw = fract(vs_TEXCOORD0.xy);
    u_xlat21.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat21.xy = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).yw;
    u_xlat16_2.x = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_21.y * u_xlat16_2.x;
    u_xlat21.xy = u_xlat3.xy * u_xlat4.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat3.xy * u_xlat5.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).zw;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).xw;
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_21.y * u_xlat16_29;
    u_xlat16_29 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_1.w * u_xlat16_29;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat7.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat1.xw = u_xlat10.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat1.yz = u_xlat10.xy * vec2(3.0, 3.0) + vs_TEXCOORD0.xy;
    u_xlat1 = fract(u_xlat1);
    u_xlat21.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat21.xy = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).yw;
    u_xlat16_2.x = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_21.y * u_xlat16_2.x;
    u_xlat21.xy = u_xlat3.xy * u_xlat4.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat3.xy * u_xlat5.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).zw;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).xw;
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_21.y * u_xlat16_29;
    u_xlat16_29 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_1.w * u_xlat16_29;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat7.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat1.xw = (-u_xlat1.yz) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat1.xw, u_xlat1.xw);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat1.xw = u_xlat1.yz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).yw;
    u_xlat16_2.x = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_1.w * u_xlat16_2.x;
    u_xlat1.xw = u_xlat3.xy * u_xlat4.xy + u_xlat1.yz;
    u_xlat10.xy = u_xlat3.xy * u_xlat5.xy + u_xlat1.yz;
    u_xlat10.xy = u_xlat10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_10.xy = texture(_MainTex, u_xlat10.xy).zw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).xw;
    u_xlat16_29 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat16_29;
    u_xlat16_29 = u_xlat16_10.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_10.y * u_xlat16_29;
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat21.xy = u_xlat3.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat21.xy = fract(u_xlat21.xy);
    u_xlat4.xy = u_xlat3.xy * u_xlat4.zw + u_xlat21.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat5.zw + u_xlat21.xy;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).zw;
    u_xlat4.xy = u_xlat4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xy = texture(_MainTex, u_xlat4.xy).xw;
    u_xlat16_2.x = u_xlat16_4.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_4.y * u_xlat16_2.x;
    u_xlat16_29 = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_3.y * u_xlat16_29;
    u_xlat3.xy = (-u_xlat21.xy) + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_21.xy = texture(_MainTex, u_xlat21.xy).yw;
    u_xlat27 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareHaloParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareHaloParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat16_29 = u_xlat16_21.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_21.y * u_xlat16_29;
    u_xlat3.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * _BloomRange.yyy;
    u_xlat16_29 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_8 = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_29 = max(u_xlat16_29, u_xlat16_8);
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_29 = u_xlat16_29 * 255.0;
    u_xlat16_29 = ceil(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_29);
    SV_Target0.w = u_xlat16_29;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat8;
vec2 u_xlat14;
vec2 u_xlat16;
vec2 u_xlat19;
float u_xlat21;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat14.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat1.xy = (-u_xlat14.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat8.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.y = texture(_MainTex, u_xlat8.xy).y;
    u_xlat2.xy = u_xlat0.xy * _LensFlareGhostsParams.yy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat16.xy = u_xlat16.xx * u_xlat2.xy;
    u_xlat3 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat4.xy = u_xlat16.xy * u_xlat3.xy + u_xlat14.xy;
    u_xlat4.xy = u_xlat4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.x = texture(_MainTex, u_xlat4.xy).x;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat14.xy = u_xlat16.xy * u_xlat4.xy + u_xlat14.xy;
    u_xlat14.xy = u_xlat14.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat8.z = texture(_MainTex, u_xlat14.xy).z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat8.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareGhostsParams.xxx;
    u_xlat5.xy = fract(vs_TEXCOORD0.xy);
    u_xlat19.xy = (-u_xlat5.xy) + vec2(0.5, 0.5);
    u_xlat21 = dot(u_xlat19.xy, u_xlat19.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat19.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.y = texture(_MainTex, u_xlat19.xy).y;
    u_xlat19.xy = u_xlat16.xy * u_xlat3.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat16.xy * u_xlat4.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.z = texture(_MainTex, u_xlat5.xy).z;
    u_xlat5.xy = u_xlat19.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.x = texture(_MainTex, u_xlat5.xy).x;
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat5.xy = u_xlat2.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(3.0, 3.0) + vs_TEXCOORD0.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat19.xy = (-u_xlat5.xy) + vec2(0.5, 0.5);
    u_xlat21 = dot(u_xlat19.xy, u_xlat19.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat19.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.y = texture(_MainTex, u_xlat19.xy).y;
    u_xlat19.xy = u_xlat16.xy * u_xlat3.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat16.xy * u_xlat4.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.z = texture(_MainTex, u_xlat5.xy).z;
    u_xlat5.xy = u_xlat19.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.x = texture(_MainTex, u_xlat5.xy).x;
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat5.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat21 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareGhostsParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat5.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.y = texture(_MainTex, u_xlat5.xy).y;
    u_xlat3.xy = u_xlat16.xy * u_xlat3.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat16.xy * u_xlat4.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.z = texture(_MainTex, u_xlat2.xy).z;
    u_xlat2.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).x;
    u_xlat5.xyz = vec3(u_xlat21) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat2.xy = u_xlat16.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat3.xy = u_xlat16.xy * u_xlat3.zw + u_xlat2.xy;
    u_xlat16.xy = u_xlat16.xy * u_xlat4.zw + u_xlat2.xy;
    u_xlat16.xy = u_xlat16.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.z = texture(_MainTex, u_xlat16.xy).z;
    u_xlat16.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.x = texture(_MainTex, u_xlat16.xy).x;
    u_xlat16.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).y;
    u_xlat21 = dot(u_xlat16.xy, u_xlat16.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = (-u_xlat21) * 1.41419995 + 1.0;
    u_xlat21 = u_xlat21 * _LensFlareHaloParams.z;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _LensFlareHaloParams.w;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_lensFlare5"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 539677
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_9;
vec2 u_xlat11;
mediump vec2 u_xlat16_11;
vec2 u_xlat20;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_26;
float u_xlat30;
mediump float u_xlat16_32;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat20.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat20.xy = fract(u_xlat20.xy);
    u_xlat1.xy = (-u_xlat20.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat11.xy = u_xlat20.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_11.xy = texture(_MainTex, u_xlat11.xy).yw;
    u_xlat16_2.x = u_xlat16_11.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_11.y * u_xlat16_2.x;
    u_xlat3 = u_xlat0.xyxy * _LensFlareGhostsParams.yyyy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat11.x = dot(u_xlat3.zw, u_xlat3.zw);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xy = u_xlat11.xx * u_xlat3.zw;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat5.xy = u_xlat11.xy * u_xlat4.xy + u_xlat20.xy;
    u_xlat5.xy = u_xlat5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xy = texture(_MainTex, u_xlat5.xy).xw;
    u_xlat16_32 = u_xlat16_5.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_5.y * u_xlat16_32;
    u_xlat5 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat20.xy = u_xlat11.xy * u_xlat5.xy + u_xlat20.xy;
    u_xlat20.xy = u_xlat20.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_20.xy = texture(_MainTex, u_xlat20.xy).zw;
    u_xlat16_32 = u_xlat16_20.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_20.y * u_xlat16_32;
    u_xlat6.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx;
    u_xlat1.xw = fract(vs_TEXCOORD0.xy);
    u_xlat7.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat30 = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = (-u_xlat30) * 1.41419995 + 1.0;
    u_xlat30 = u_xlat30 * _LensFlareGhostsParams.z;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * _LensFlareGhostsParams.w;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat7.xy = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_7.xy = texture(_MainTex, u_xlat7.xy).yw;
    u_xlat16_2.x = u_xlat16_7.x * _BloomRange.x;
    u_xlat16_2.y = u_xlat16_7.y * u_xlat16_2.x;
    u_xlat7.xy = u_xlat11.xy * u_xlat4.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat11.xy * u_xlat5.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).zw;
    u_xlat7.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_7.xy = texture(_MainTex, u_xlat7.xy).xw;
    u_xlat16_32 = u_xlat16_7.x * _BloomRange.x;
    u_xlat16_2.x = u_xlat16_7.y * u_xlat16_32;
    u_xlat16_32 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_2.z = u_xlat16_1.w * u_xlat16_32;
    u_xlat7.xyz = vec3(u_xlat30) * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat7.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat1.xw = u_xlat3.zw * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat2 = u_xlat3 * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = fract(u_xlat2);
    u_xlat1.xw = fract(u_xlat1.xw);
    u_xlat3.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat30 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = (-u_xlat30) * 1.41419995 + 1.0;
    u_xlat30 = u_xlat30 * _LensFlareGhostsParams.z;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * _LensFlareGhostsParams.w;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xy = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).yw;
    u_xlat16_8.x = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_8.y = u_xlat16_3.y * u_xlat16_8.x;
    u_xlat3.xy = u_xlat11.xy * u_xlat4.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat11.xy * u_xlat5.xy + u_xlat1.xw;
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).zw;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xy = texture(_MainTex, u_xlat3.xy).xw;
    u_xlat16_38 = u_xlat16_3.x * _BloomRange.x;
    u_xlat16_8.x = u_xlat16_3.y * u_xlat16_38;
    u_xlat16_38 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_8.z = u_xlat16_1.w * u_xlat16_38;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat16_8.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LensFlareGhostsParams.xxx + u_xlat6.xyz;
    u_xlat6 = (-u_xlat2) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat30 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat1.x = dot(u_xlat6.zw, u_xlat6.zw);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = (-u_xlat30) * 1.41419995 + 1.0;
    u_xlat30 = u_xlat30 * _LensFlareGhostsParams.z;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * _LensFlareGhostsParams.w;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat6 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_6.xy = texture(_MainTex, u_xlat6.xy).yw;
    u_xlat16_26.xy = texture(_MainTex, u_xlat6.zw).yw;
    u_xlat16_8.x = u_xlat16_6.x * _BloomRange.x;
    u_xlat16_8.y = u_xlat16_6.y * u_xlat16_8.x;
    u_xlat7 = u_xlat11.xyxy * u_xlat4.xyxy + u_xlat2;
    u_xlat2 = u_xlat11.xyxy * u_xlat5.xyxy + u_xlat2;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat7 = u_xlat7 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4.xy = texture(_MainTex, u_xlat7.xy).xw;
    u_xlat16_5.xy = texture(_MainTex, u_xlat7.zw).xw;
    u_xlat16_38 = u_xlat16_4.x * _BloomRange.x;
    u_xlat16_8.x = u_xlat16_4.y * u_xlat16_38;
    u_xlat16_4.xy = texture(_MainTex, u_xlat2.xy).zw;
    u_xlat16_6.xy = texture(_MainTex, u_xlat2.zw).zw;
    u_xlat16_38 = u_xlat16_4.x * _BloomRange.x;
    u_xlat16_8.z = u_xlat16_4.y * u_xlat16_38;
    u_xlat7.xyz = vec3(u_xlat30) * u_xlat16_8.xyz;
    u_xlat7.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat3.xyz = u_xlat7.xyz * _LensFlareGhostsParams.xxx + u_xlat3.xyz;
    u_xlat16_8.x = u_xlat16_26.x * _BloomRange.x;
    u_xlat16_8.y = u_xlat16_26.y * u_xlat16_8.x;
    u_xlat16_38 = u_xlat16_5.x * _BloomRange.x;
    u_xlat16_8.x = u_xlat16_5.y * u_xlat16_38;
    u_xlat16_38 = u_xlat16_6.x * _BloomRange.x;
    u_xlat16_8.z = u_xlat16_6.y * u_xlat16_38;
    u_xlat6.xyz = u_xlat1.xxx * u_xlat16_8.xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx + u_xlat3.xyz;
    u_xlat1.xw = u_xlat11.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat1.xw = fract(u_xlat1.xw);
    u_xlat4.xy = u_xlat11.xy * u_xlat4.zw + u_xlat1.xw;
    u_xlat11.xy = u_xlat11.xy * u_xlat5.zw + u_xlat1.xw;
    u_xlat11.xy = u_xlat11.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_11.xy = texture(_MainTex, u_xlat11.xy).zw;
    u_xlat4.xy = u_xlat4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xy = texture(_MainTex, u_xlat4.xy).xw;
    u_xlat16_8.x = u_xlat16_4.x * _BloomRange.x;
    u_xlat16_8.x = u_xlat16_4.y * u_xlat16_8.x;
    u_xlat16_38 = u_xlat16_11.x * _BloomRange.x;
    u_xlat16_8.z = u_xlat16_11.y * u_xlat16_38;
    u_xlat11.xy = (-u_xlat1.xw) + vec2(0.5, 0.5);
    u_xlat1.xw = u_xlat1.xw * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xw = texture(_MainTex, u_xlat1.xw).yw;
    u_xlat30 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat30 = (-u_xlat30) * 1.41419995 + 1.0;
    u_xlat30 = u_xlat30 * _LensFlareHaloParams.z;
    u_xlat30 = log2(u_xlat30);
    u_xlat30 = u_xlat30 * _LensFlareHaloParams.w;
    u_xlat30 = exp2(u_xlat30);
    u_xlat16_38 = u_xlat16_1.x * _BloomRange.x;
    u_xlat16_8.y = u_xlat16_1.w * u_xlat16_38;
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat16_8.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_0.xyz + u_xlat3.xyz;
    u_xlat16_8.xyz = u_xlat0.xyz * _BloomRange.yyy;
    u_xlat16_38 = max(u_xlat16_8.y, u_xlat16_8.x);
    u_xlat16_9 = max(u_xlat16_8.z, 9.99999997e-07);
    u_xlat16_38 = max(u_xlat16_38, u_xlat16_9);
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_38 = u_xlat16_38 * 255.0;
    u_xlat16_38 = ceil(u_xlat16_38);
    u_xlat16_38 = u_xlat16_38 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_8.xyz / vec3(u_xlat16_38);
    SV_Target0.w = u_xlat16_38;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _LensFlareGhostsParams;
uniform 	vec4 _LensFlareHaloParams;
uniform 	float _LensFlareGhostChrDistortion;
uniform 	float _LensFlareHaloChrDistortion;
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _LensFlareLUT;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec3 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat10;
vec2 u_xlat18;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat27;
float u_xlat28;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat18.xy = u_xlat0.xy * _LensFlareGhostsParams.yy + vs_TEXCOORD0.xy;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat1.xy = (-u_xlat18.xy) + vec2(0.5, 0.5);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) * 1.41419995 + 1.0;
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.z;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LensFlareGhostsParams.w;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat10.xy = u_xlat18.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10.y = texture(_MainTex, u_xlat10.xy).y;
    u_xlat2 = u_xlat0.xyxy * _LensFlareGhostsParams.yyyy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1.41419995;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xy = u_xlat2.zw * u_xlat3.xx;
    u_xlat4 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * (-_MainTex_TexelSize.xxxx);
    u_xlat21.xy = u_xlat3.xy * u_xlat4.xy + u_xlat18.xy;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10.x = texture(_MainTex, u_xlat21.xy).x;
    u_xlat5 = vec4(_LensFlareGhostChrDistortion, _LensFlareGhostChrDistortion, _LensFlareHaloChrDistortion, _LensFlareHaloChrDistortion) * _MainTex_TexelSize.xxxx;
    u_xlat18.xy = u_xlat3.xy * u_xlat5.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10.z = texture(_MainTex, u_xlat18.xy).z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyz = texture(_LensFlareLUT, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LensFlareGhostsParams.xxx;
    u_xlat21.xy = fract(vs_TEXCOORD0.xy);
    u_xlat6.xy = (-u_xlat21.xy) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat6.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.y = texture(_MainTex, u_xlat6.xy).y;
    u_xlat7.xy = u_xlat3.xy * u_xlat4.xy + u_xlat21.xy;
    u_xlat21.xy = u_xlat3.xy * u_xlat5.xy + u_xlat21.xy;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.z = texture(_MainTex, u_xlat21.xy).z;
    u_xlat21.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.x = texture(_MainTex, u_xlat21.xy).x;
    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat21.xy = u_xlat2.zw * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat2 = u_xlat2 * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = fract(u_xlat2);
    u_xlat21.xy = fract(u_xlat21.xy);
    u_xlat6.xy = (-u_xlat21.xy) + vec2(0.5, 0.5);
    u_xlat27 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat6.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.y = texture(_MainTex, u_xlat6.xy).y;
    u_xlat7.xy = u_xlat3.xy * u_xlat4.xy + u_xlat21.xy;
    u_xlat21.xy = u_xlat3.xy * u_xlat5.xy + u_xlat21.xy;
    u_xlat21.xy = u_xlat21.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.z = texture(_MainTex, u_xlat21.xy).z;
    u_xlat21.xy = u_xlat7.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.x = texture(_MainTex, u_xlat21.xy).x;
    u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat6 = (-u_xlat2) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat27 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat28 = dot(u_xlat6.zw, u_xlat6.zw);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat28) * 1.41419995 + 1.0;
    u_xlat28 = u_xlat28 * _LensFlareGhostsParams.z;
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _LensFlareGhostsParams.w;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareGhostsParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat6 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat7.y = texture(_MainTex, u_xlat6.xy).y;
    u_xlat6.y = texture(_MainTex, u_xlat6.zw).y;
    u_xlat8 = u_xlat3.xyxy * u_xlat4.xyxy + u_xlat2;
    u_xlat2 = u_xlat3.xyxy * u_xlat5.xyxy + u_xlat2;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat8 = u_xlat8 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat7.x = texture(_MainTex, u_xlat8.xy).x;
    u_xlat6.x = texture(_MainTex, u_xlat8.zw).x;
    u_xlat7.z = texture(_MainTex, u_xlat2.xy).z;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).z;
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat6.xyz = vec3(u_xlat27) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LensFlareGhostsParams.xxx + u_xlat1.xyz;
    u_xlat2.xy = u_xlat3.xy * _LensFlareHaloParams.yy + vs_TEXCOORD0.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat20.xy = u_xlat3.xy * u_xlat4.zw + u_xlat2.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat5.zw + u_xlat2.xy;
    u_xlat3.xy = u_xlat3.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.z = texture(_MainTex, u_xlat3.xy).z;
    u_xlat20.xy = u_xlat20.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_MainTex, u_xlat20.xy).x;
    u_xlat20.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.y = texture(_MainTex, u_xlat2.xy).y;
    u_xlat27 = dot(u_xlat20.xy, u_xlat20.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = (-u_xlat27) * 1.41419995 + 1.0;
    u_xlat27 = u_xlat27 * _LensFlareHaloParams.z;
    u_xlat27 = log2(u_xlat27);
    u_xlat27 = u_xlat27 * _LensFlareHaloParams.w;
    u_xlat27 = exp2(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _LensFlareHaloParams.xxx;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_downsamplerNoWeightedAvg"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 633899
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat4 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_5 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_9.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_11 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _BloomRange.xxx;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_11.www + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_4.www + u_xlat16_10.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_5.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_12.xyz * u_xlat16_11.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_0.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_40 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_3.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_3.x);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 * 255.0;
    u_xlat16_40 = ceil(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_40);
    SV_Target0.w = u_xlat16_40;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_5.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_downsampler_with_karis"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 703347
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat4 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_5 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_40 = dot(u_xlat16_1.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_40 = u_xlat16_40 + 1.0;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_1.xyz = vec3(u_xlat16_40) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_9.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_11 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _BloomRange.xxx;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_11.www + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_4.www + u_xlat16_10.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_40 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_40 = u_xlat16_40 + 1.0;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_40) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_5.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_40 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_40 = u_xlat16_40 + 1.0;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_40) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_12.xyz * u_xlat16_11.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_40 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_40 = u_xlat16_40 + 1.0;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_40) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_0.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_40 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_40 = u_xlat16_40 + 1.0;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_3.xyz = vec3(u_xlat16_40) * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_40 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_3.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_3.x);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 * 255.0;
    u_xlat16_40 = ceil(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_40);
    SV_Target0.w = u_xlat16_40;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = float(1.0) / u_xlat16_32;
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_32 = dot(u_xlat16_7.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = float(1.0) / u_xlat16_32;
    u_xlat16_5.xyz = u_xlat16_7.xyz * vec3(u_xlat16_32) + u_xlat16_5.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_6.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_32 = dot(u_xlat16_8.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = float(1.0) / u_xlat16_32;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat16_32) + u_xlat16_5.xyz;
    u_xlat16_32 = dot(u_xlat16_7.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = float(1.0) / u_xlat16_32;
    u_xlat16_5.xyz = u_xlat16_7.xyz * vec3(u_xlat16_32) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_32 = dot(u_xlat16_7.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = float(1.0) / u_xlat16_32;
    u_xlat16_7.xyz = vec3(u_xlat16_32) * u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_downsampler_without_karis"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 739462
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat4 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_5 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_10.xyz = u_xlat16_8.www * u_xlat16_9.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_11 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_12.xyz = u_xlat16_11.xyz * _BloomRange.xxx;
    u_xlat16_10.xyz = u_xlat16_12.xyz * u_xlat16_11.www + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_4.www + u_xlat16_10.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_5.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_12.xyz * u_xlat16_11.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_0.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_40 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_3.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_40 = max(u_xlat16_40, u_xlat16_3.x);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 * 255.0;
    u_xlat16_40 = ceil(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_40);
    SV_Target0.w = u_xlat16_40;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_5.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_5.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_downsampler_temp_filter_with_karis"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 845742
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _TempFilterValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_43;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat4 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_5 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_9 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_10.xyz = u_xlat16_8.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_8.www + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_43 = dot(u_xlat16_1.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_43 = u_xlat16_43 + 1.0;
    u_xlat16_43 = float(1.0) / u_xlat16_43;
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_10.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_12 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * _BloomRange.xxx;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_12.www + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_4.www + u_xlat16_11.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_43 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_43 = u_xlat16_43 + 1.0;
    u_xlat16_43 = float(1.0) / u_xlat16_43;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_5.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_43 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_43 = u_xlat16_43 + 1.0;
    u_xlat16_43 = float(1.0) / u_xlat16_43;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_12.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_43 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_43 = u_xlat16_43 + 1.0;
    u_xlat16_43 = float(1.0) / u_xlat16_43;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_43) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_0.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_43 = dot(u_xlat16_3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_43 = u_xlat16_43 + 1.0;
    u_xlat16_43 = float(1.0) / u_xlat16_43;
    u_xlat16_3.xyz = vec3(u_xlat16_43) * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_43 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_3.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_43 = max(u_xlat16_43, u_xlat16_3.x);
    u_xlat16_43 = min(u_xlat16_43, 1.0);
    u_xlat16_43 = u_xlat16_43 * 255.0;
    u_xlat16_43 = ceil(u_xlat16_43);
    u_xlat16_0.w = u_xlat16_43 * 0.00392156886;
    u_xlat16_0.xyz = u_xlat16_1.xyz / u_xlat16_0.www;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_9;
    SV_Target0 = vec4(_TempFilterValue) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _TempFilterValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_4 = texture(_AnamorphicRTS0, u_xlat4.xy);
    u_xlat16_6.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_36 = u_xlat16_36 + 1.0;
    u_xlat16_36 = float(1.0) / u_xlat16_36;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_7.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_36 = dot(u_xlat16_8.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_36 = u_xlat16_36 + 1.0;
    u_xlat16_36 = float(1.0) / u_xlat16_36;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_36) + u_xlat16_6.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_8.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_36 = dot(u_xlat16_9.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_36 = u_xlat16_36 + 1.0;
    u_xlat16_36 = float(1.0) / u_xlat16_36;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(u_xlat16_36) + u_xlat16_6.xyz;
    u_xlat16_36 = dot(u_xlat16_8.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_36 = u_xlat16_36 + 1.0;
    u_xlat16_36 = float(1.0) / u_xlat16_36;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_36) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_36 = dot(u_xlat16_8.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
    u_xlat16_36 = u_xlat16_36 + 1.0;
    u_xlat16_36 = float(1.0) / u_xlat16_36;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * u_xlat16_8.xyz;
    u_xlat16_0.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_6.xyz;
    u_xlat16_0.w = 0.0;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_4;
    SV_Target0 = vec4(_TempFilterValue) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_downsampler_temp_filter_without_karis"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 892850
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _TempFilterValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_43;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat4 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_5 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_9 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_10.xyz = u_xlat16_8.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_8.www + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_11.xyz = u_xlat16_8.www * u_xlat16_10.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_12 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * _BloomRange.xxx;
    u_xlat16_11.xyz = u_xlat16_13.xyz * u_xlat16_12.www + u_xlat16_11.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_4.www + u_xlat16_11.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_7.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_7.xyz = u_xlat16_4.www * u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_5.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_2.www + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_12.www + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_8.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat2.xy = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_2.www + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_0.www + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_43 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_3.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_43 = max(u_xlat16_43, u_xlat16_3.x);
    u_xlat16_43 = min(u_xlat16_43, 1.0);
    u_xlat16_43 = u_xlat16_43 * 255.0;
    u_xlat16_43 = ceil(u_xlat16_43);
    u_xlat16_0.w = u_xlat16_43 * 0.00392156886;
    u_xlat16_0.xyz = u_xlat16_1.xyz / u_xlat16_0.www;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_9;
    SV_Target0 = vec4(_TempFilterValue) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _TempFilterValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(2.0, 0.0, -2.0, 2.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat16_4 = texture(_AnamorphicRTS0, u_xlat4.xy);
    u_xlat16_6.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -2.0, -2.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_7.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_6.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-2.0, -2.0, 0.0, -2.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz + u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_6.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    u_xlat16_0.xyz = u_xlat16_8.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_6.xyz;
    u_xlat16_0.w = 0.0;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_4;
    SV_Target0 = vec4(_TempFilterValue) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_horizontal_gaussian_blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 934411
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat0.x = _MainTex_TexelSize.x * _BlurRadius;
    u_xlat0.xz = u_xlat0.xx * vec2(1.38461542, 3.23076916);
    u_xlat0.y = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat2 = u_xlat0 + vs_TEXCOORD0.xyxy;
    u_xlat0 = (-u_xlat0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_4.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_4.xyz;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_4.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_16 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_4.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_16 = max(u_xlat16_16, u_xlat16_4.x);
    u_xlat16_16 = min(u_xlat16_16, 1.0);
    u_xlat16_16 = u_xlat16_16 * 255.0;
    u_xlat16_16 = ceil(u_xlat16_16);
    u_xlat16_16 = u_xlat16_16 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
    SV_Target0.w = u_xlat16_16;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat15 = _MainTex_TexelSize.x * _BlurRadius;
    u_xlat1.xz = vec2(u_xlat15) * vec2(1.38461542, 3.23076916);
    u_xlat1.y = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat2 = u_xlat1 + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-u_xlat1) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_4.xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_4.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_vertical_gaussian_blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1011126
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat0.x = _MainTex_TexelSize.y * _BlurRadius;
    u_xlat0.y = float(1.38461542);
    u_xlat0.z = float(3.23076916);
    u_xlat2 = vec4(0.0, 1.38461542, 0.0, 3.23076916) * u_xlat0.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat0 = vec4(-0.0, -1.38461542, -0.0, -3.23076916) * u_xlat0.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_4.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_4.xyz;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_4.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_16 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_4.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_16 = max(u_xlat16_16, u_xlat16_4.x);
    u_xlat16_16 = min(u_xlat16_16, 1.0);
    u_xlat16_16 = u_xlat16_16 * 255.0;
    u_xlat16_16 = ceil(u_xlat16_16);
    u_xlat16_16 = u_xlat16_16 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
    SV_Target0.w = u_xlat16_16;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.x = _MainTex_TexelSize.y * _BlurRadius;
    u_xlat1.y = float(1.38461542);
    u_xlat1.z = float(3.23076916);
    u_xlat2 = vec4(0.0, 1.38461542, 0.0, 3.23076916) * u_xlat1.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat1 = vec4(-0.0, -1.38461542, -0.0, -3.23076916) * u_xlat1.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = u_xlat2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_4.xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_4.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_vertical_gaussian_blur_temp_filter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1097314
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurRadius;
uniform 	mediump float _TempFilterValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat1.x = _MainTex_TexelSize.y * _BlurRadius;
    u_xlat1.y = float(1.38461542);
    u_xlat1.z = float(3.23076916);
    u_xlat3 = vec4(0.0, 1.38461542, 0.0, 3.23076916) * u_xlat1.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat1 = vec4(-0.0, -1.38461542, -0.0, -3.23076916) * u_xlat1.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat3 = u_xlat3 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_4 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_3 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_5.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_5.xyz;
    u_xlat16_4 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_5.xyz = u_xlat16_4.xyz * _BloomRange.xxx;
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_5.xyz = u_xlat16_1.www * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_20 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_5.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_20 = max(u_xlat16_20, u_xlat16_5.x);
    u_xlat16_20 = min(u_xlat16_20, 1.0);
    u_xlat16_20 = u_xlat16_20 * 255.0;
    u_xlat16_20 = ceil(u_xlat16_20);
    u_xlat16_1.w = u_xlat16_20 * 0.00392156886;
    u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.www;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_1);
    SV_Target0 = vec4(_TempFilterValue) * u_xlat16_0 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _BlurRadius;
uniform 	mediump float _TempFilterValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.y * _BlurRadius;
    u_xlat0.y = float(1.38461542);
    u_xlat0.z = float(3.23076916);
    u_xlat1 = vec4(0.0, 1.38461542, 0.0, 3.23076916) * u_xlat0.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat0 = vec4(-0.0, -1.38461542, -0.0, -3.23076916) * u_xlat0.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_3.xyz;
    u_xlat16_0.w = 0.0;
    u_xlat16_1 = (-u_xlat16_0) + u_xlat16_2;
    SV_Target0 = vec4(_TempFilterValue) * u_xlat16_1 + u_xlat16_0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_upscaleTentFirstPass"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1139028
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.xy = (-_MainTex_TexelSize.xy) * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 1.0, -1.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_13 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_3.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_13 = max(u_xlat16_13, u_xlat16_3.x);
    u_xlat16_13 = min(u_xlat16_13, 1.0);
    u_xlat16_13 = u_xlat16_13 * 255.0;
    u_xlat16_13 = ceil(u_xlat16_13);
    u_xlat16_13 = u_xlat16_13 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_13);
    SV_Target0.w = u_xlat16_13;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_MainTex_TexelSize.xy) * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 1.0, -1.0);
    u_xlat1 = u_xlat1 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_upscaleTent"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1236207
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = (-_MainTex_TexelSize.xy) * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 1.0, -1.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_4.xyz = u_xlat16_3.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_1.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * _BloomRange.xxx;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_16 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_4.x = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_16 = max(u_xlat16_16, u_xlat16_4.x);
    u_xlat16_16 = min(u_xlat16_16, 1.0);
    u_xlat16_16 = u_xlat16_16 * 255.0;
    u_xlat16_16 = ceil(u_xlat16_16);
    u_xlat16_16 = u_xlat16_16 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_16);
    SV_Target0.w = u_xlat16_16;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BloomParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_MainTex_TexelSize.xy) * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 1.0, -1.0);
    u_xlat1 = u_xlat1 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * _BloomParams.zzzz + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * _BloomParams.zz + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.0625, 0.0625, 0.0625) + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS1"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1280407
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _BloomRange.yyy;
    u_xlat16_10 = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_2 = max(u_xlat16_1.z, 9.99999997e-07);
    u_xlat16_10 = max(u_xlat16_10, u_xlat16_2);
    u_xlat16_10 = min(u_xlat16_10, 1.0);
    u_xlat16_10 = u_xlat16_10 * 255.0;
    u_xlat16_10 = ceil(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_10);
    SV_Target0.w = u_xlat16_10;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * _AnamorphicGlareWeights0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS2"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1340444
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS3"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1441256
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS2, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS4"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1453339
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS2, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS3, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS5"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1538350
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS4, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS2, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS3, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS4, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS6"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1593055
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS5;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS4, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS5, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights5.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS5;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS2, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS3, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS4, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS5, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights5.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS7"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1660750
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _AnamorphicGlareWeights6;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS5;
UNITY_LOCATION(6) uniform mediump sampler2D _AnamorphicRTS6;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS4, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS5, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS6, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights5.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights6.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _AnamorphicGlareWeights6;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS5;
UNITY_LOCATION(6) uniform mediump sampler2D _AnamorphicRTS6;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS2, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS3, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS4, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS5, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS6, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights6.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_weightedAddPS8"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1742668
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _AnamorphicGlareWeights6;
uniform 	mediump vec4 _AnamorphicGlareWeights7;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS5;
UNITY_LOCATION(6) uniform mediump sampler2D _AnamorphicRTS6;
UNITY_LOCATION(7) uniform mediump sampler2D _AnamorphicRTS7;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS4, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS5, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights5.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_1 = texture(_AnamorphicRTS6, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS7, u_xlat0.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights6.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights7.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BloomRange.yyy;
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_3.x = max(u_xlat16_2.z, 9.99999997e-07);
    u_xlat16_14 = max(u_xlat16_14, u_xlat16_3.x);
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlat16_14 = u_xlat16_14 * 255.0;
    u_xlat16_14 = ceil(u_xlat16_14);
    u_xlat16_14 = u_xlat16_14 * 0.00392156886;
    SV_Target0.xyz = u_xlat16_2.xyz / vec3(u_xlat16_14);
    SV_Target0.w = u_xlat16_14;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _AnamorphicGlareWeights6;
uniform 	mediump vec4 _AnamorphicGlareWeights7;
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS4;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS5;
UNITY_LOCATION(6) uniform mediump sampler2D _AnamorphicRTS6;
UNITY_LOCATION(7) uniform mediump sampler2D _AnamorphicRTS7;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_AnamorphicRTS1, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _AnamorphicGlareWeights1.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS0, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights0.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS2, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights2.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS3, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights3.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS4, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights4.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS5, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_AnamorphicRTS6, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_AnamorphicRTS7, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = _AnamorphicGlareWeights6.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = _AnamorphicGlareWeights7.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_BokehFiltering"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1813721
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _AnamorphicGlareWeights6;
uniform 	mediump vec4 _AnamorphicGlareWeights7;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BokehParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_10;
float u_xlat11;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat16_0 = (-_BokehParams.y) + _BokehParams.z;
    u_xlat16_0 = _BokehParams.y / u_xlat16_0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat16_5.x = u_xlat1.x * _ProjectionParams.z;
    u_xlat16_10.x = u_xlat1.x * _ProjectionParams.z + (-_BokehParams.z);
    u_xlat16_5.x = abs(u_xlat16_10.x) / u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * _BokehParams.x;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.x;
    u_xlat16_0 = u_xlat16_0 * 41.6669998;
    u_xlat16_0 = max(u_xlat16_0, 0.0);
    u_xlat16_0 = min(u_xlat16_0, _BokehParams.w);
    u_xlat16_5.xy = _AnamorphicGlareWeights1.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat16_5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16 = texture(_CameraDepthTexture, u_xlat16_5.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16<u_xlat1.x);
#else
    u_xlatb16 = u_xlat16<u_xlat1.x;
#endif
    u_xlat16_2 = texture(_MainTex, u_xlat6.xy);
    u_xlat16_5.x = u_xlat16_2.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_5.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_5.x<u_xlat16_0;
#endif
    u_xlat11 = u_xlat16_0 * 30.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat16 = (u_xlatb16) ? u_xlat11 : 1.0;
    u_xlat16_5.x = (u_xlatb6) ? u_xlat16 : 1.0;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2;
    u_xlat16_10.xy = _AnamorphicGlareWeights0.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_10.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights2.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights3.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights4.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights5.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights6.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
    u_xlat3.xy = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x<u_xlat1.x);
#else
    u_xlatb6 = u_xlat6.x<u_xlat1.x;
#endif
    u_xlat6.x = (u_xlatb6) ? u_xlat11 : 1.0;
    u_xlat16_10.x = u_xlat16_3.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb16 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb16) ? u_xlat6.x : 1.0;
    u_xlat16_2 = u_xlat16_3 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights7.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
    u_xlat3.xy = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat6.x<u_xlat1.x);
#else
    u_xlatb1 = u_xlat6.x<u_xlat1.x;
#endif
    u_xlat1.x = (u_xlatb1) ? u_xlat11 : 1.0;
    u_xlat16_10.x = u_xlat16_3.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_0 = (u_xlatb6) ? u_xlat1.x : 1.0;
    u_xlat16_1 = u_xlat16_3 * vec4(u_xlat16_0) + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_5.x;
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 _AnamorphicGlareWeights0;
uniform 	mediump vec4 _AnamorphicGlareWeights1;
uniform 	mediump vec4 _AnamorphicGlareWeights2;
uniform 	mediump vec4 _AnamorphicGlareWeights3;
uniform 	mediump vec4 _AnamorphicGlareWeights4;
uniform 	mediump vec4 _AnamorphicGlareWeights5;
uniform 	mediump vec4 _AnamorphicGlareWeights6;
uniform 	mediump vec4 _AnamorphicGlareWeights7;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BokehParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_10;
float u_xlat11;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat16_0 = (-_BokehParams.y) + _BokehParams.z;
    u_xlat16_0 = _BokehParams.y / u_xlat16_0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat16_5.x = u_xlat1.x * _ProjectionParams.z;
    u_xlat16_10.x = u_xlat1.x * _ProjectionParams.z + (-_BokehParams.z);
    u_xlat16_5.x = abs(u_xlat16_10.x) / u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * _BokehParams.x;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.x;
    u_xlat16_0 = u_xlat16_0 * 41.6669998;
    u_xlat16_0 = max(u_xlat16_0, 0.0);
    u_xlat16_0 = min(u_xlat16_0, _BokehParams.w);
    u_xlat16_5.xy = _AnamorphicGlareWeights1.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat16_5.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16 = texture(_CameraDepthTexture, u_xlat16_5.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16<u_xlat1.x);
#else
    u_xlatb16 = u_xlat16<u_xlat1.x;
#endif
    u_xlat16_2 = texture(_MainTex, u_xlat6.xy);
    u_xlat16_5.x = u_xlat16_2.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_5.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_5.x<u_xlat16_0;
#endif
    u_xlat11 = u_xlat16_0 * 30.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat16 = (u_xlatb16) ? u_xlat11 : 1.0;
    u_xlat16_5.x = (u_xlatb6) ? u_xlat16 : 1.0;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2;
    u_xlat16_10.xy = _AnamorphicGlareWeights0.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_10.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights2.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights3.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights4.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights5.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.xz = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<u_xlat1.x);
#else
    u_xlatb3 = u_xlat3.x<u_xlat1.x;
#endif
    u_xlat3.x = (u_xlatb3) ? u_xlat11 : 1.0;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xz);
    u_xlat16_10.x = u_xlat16_4.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb6) ? u_xlat3.x : 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights6.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
    u_xlat3.xy = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x<u_xlat1.x);
#else
    u_xlatb6 = u_xlat6.x<u_xlat1.x;
#endif
    u_xlat6.x = (u_xlatb6) ? u_xlat11 : 1.0;
    u_xlat16_10.x = u_xlat16_3.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb16 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_10.x = (u_xlatb16) ? u_xlat6.x : 1.0;
    u_xlat16_2 = u_xlat16_3 * u_xlat16_10.xxxx + u_xlat16_2;
    u_xlat16_5.x = u_xlat16_10.x + u_xlat16_5.x;
    u_xlat16_10.xy = _AnamorphicGlareWeights7.xy * vec2(u_xlat16_0) + vs_TEXCOORD0.xy;
    u_xlat6.x = texture(_CameraDepthTexture, u_xlat16_10.xy).x;
    u_xlat3.xy = u_xlat16_10.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat6.x<u_xlat1.x);
#else
    u_xlatb1 = u_xlat6.x<u_xlat1.x;
#endif
    u_xlat1.x = (u_xlatb1) ? u_xlat11 : 1.0;
    u_xlat16_10.x = u_xlat16_3.w + 0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_10.x<u_xlat16_0);
#else
    u_xlatb6 = u_xlat16_10.x<u_xlat16_0;
#endif
    u_xlat16_0 = (u_xlatb6) ? u_xlat1.x : 1.0;
    u_xlat16_1 = u_xlat16_3 * vec4(u_xlat16_0) + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_5.x;
    SV_Target0 = u_xlat16_1 / vec4(u_xlat16_0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_BokehComposition2S"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1844344
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat0 = min(u_xlat16_0, u_xlat16_1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat0 = min(u_xlat16_0, u_xlat16_1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_BokehComposition3S"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1955943
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_BokehComposition4S"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1978723
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS2;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS2;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_BokehComposition5S"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2058421
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS3;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS3;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_BokehComposition6S"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2152655
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS4;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS4, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AnamorphicRTS0;
UNITY_LOCATION(2) uniform mediump sampler2D _AnamorphicRTS1;
UNITY_LOCATION(3) uniform mediump sampler2D _AnamorphicRTS2;
UNITY_LOCATION(4) uniform mediump sampler2D _AnamorphicRTS3;
UNITY_LOCATION(5) uniform mediump sampler2D _AnamorphicRTS4;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2 = texture(_AnamorphicRTS0, u_xlat0.xy);
    u_xlat1 = min(u_xlat16_1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS1, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS2, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat16_2 = texture(_AnamorphicRTS3, u_xlat0.xy);
    u_xlat16_0 = texture(_AnamorphicRTS4, u_xlat0.xy);
    u_xlat1 = min(u_xlat1, u_xlat16_2);
    u_xlat0 = min(u_xlat16_0, u_xlat1);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
 Pass {
  Name "frag_decode"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2170131
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _BloomRange;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * _BloomRange.xxx;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
SubProgram "gles3 " {
Keywords { "AB_HIGH_PRECISION" }
""
}
}
}
}
}