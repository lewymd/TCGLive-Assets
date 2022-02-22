//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/UI/Speedlines_Player_L" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
_ColorLight ("Color Light", Color) = (0.2470588,0.427451,0.6980392,0)
_ColorDark ("Color Dark", Color) = (0.04672481,0.1423044,0.2830189,0)
_Speedlines1 ("Speedlines 1", 2D) = "white" { }
_Speedlines2 ("Speedlines 2", 2D) = "white" { }
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 27735
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ColorDark;
uniform 	vec4 _ColorLight;
UNITY_LOCATION(0) uniform mediump sampler2D _Speedlines1;
UNITY_LOCATION(1) uniform mediump sampler2D _Speedlines2;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_5;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.0250000004, 0.800000012);
    u_xlat0.xy = _Time.yy * vec2(0.300000012, -0.0299999993) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Speedlines2, u_xlat0.xy).xyz;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat2.xz = vs_TEXCOORD0.xy * vec2(0.00999999978, 0.5) + vec2(0.300000012, 0.0);
    u_xlat2.xz = _Time.yy * vec2(0.100000001, 0.0500000007) + u_xlat2.xz;
    u_xlat16_2.xz = texture(_Speedlines2, u_xlat2.xz).zw;
    u_xlat0.x = u_xlat16_2.x + u_xlat0.x;
    u_xlat2.x = u_xlat16_2.z + u_xlat16_0.z;
    u_xlat2.xyz = u_xlat2.xxx * vec3(0.00777109014, 0.0489586517, 0.140004829);
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.0472796746, 0.118688121, 0.23420532) + u_xlat2.xyz;
    u_xlat1 = _Time.yyyy * vec4(0.300000012, -0.0299999993, 0.349999994, 0.0500000007);
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.100000001, 1.5, 0.0500000007, 1.29999995) + u_xlat1;
    u_xlat16_5.xy = texture(_Speedlines1, u_xlat1.zw).yz;
    u_xlat16_1.xy = texture(_Speedlines1, u_xlat1.xy).xy;
    u_xlat6 = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_5.x + u_xlat16_5.y;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.0466265418, 0.293751895, 0.840029001);
    u_xlat1.xyz = vec3(u_xlat6) * vec3(0.0506732501, 0.179277509, 0.419999987) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD0.y;
    u_xlat6 = u_xlat6 * 9.96000004 + -1.42999995;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xyz = (-_ColorDark.xyz) + _ColorLight.xyz;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + _ColorDark.xyz;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ColorDark;
uniform 	vec4 _ColorLight;
UNITY_LOCATION(0) uniform mediump sampler2D _Speedlines1;
UNITY_LOCATION(1) uniform mediump sampler2D _Speedlines2;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_8;
float u_xlat10;
void main()
{
    u_xlat16_0 = vs_COLOR0.w + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_0<0.0);
#else
    u_xlatb1 = u_xlat16_0<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(0.0250000004, 0.800000012);
    u_xlat1.xy = _Time.yy * vec2(0.300000012, -0.0299999993) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_Speedlines2, u_xlat1.xy).xyz;
    u_xlat1.x = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat4.xz = vs_TEXCOORD0.xy * vec2(0.00999999978, 0.5) + vec2(0.300000012, 0.0);
    u_xlat4.xz = _Time.yy * vec2(0.100000001, 0.0500000007) + u_xlat4.xz;
    u_xlat16_4.xz = texture(_Speedlines2, u_xlat4.xz).zw;
    u_xlat1.x = u_xlat16_4.x + u_xlat1.x;
    u_xlat4.x = u_xlat16_4.z + u_xlat16_1.z;
    u_xlat4.xyz = u_xlat4.xxx * vec3(0.00777109014, 0.0489586517, 0.140004829);
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.0472796746, 0.118688121, 0.23420532) + u_xlat4.xyz;
    u_xlat0 = _Time.yyyy * vec4(0.300000012, -0.0299999993, 0.349999994, 0.0500000007);
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(0.100000001, 1.5, 0.0500000007, 1.29999995) + u_xlat0;
    u_xlat16_2.xy = texture(_Speedlines1, u_xlat0.zw).yz;
    u_xlat16_8.xy = texture(_Speedlines1, u_xlat0.xy).xy;
    u_xlat10 = u_xlat16_8.y + u_xlat16_8.x;
    u_xlat2.x = u_xlat16_2.x + u_xlat16_2.y;
    u_xlat2.xyz = u_xlat2.xxx * vec3(0.0466265418, 0.293751895, 0.840029001);
    u_xlat2.xyz = vec3(u_xlat10) * vec3(0.0506732501, 0.179277509, 0.419999987) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat10 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat10 = u_xlat10 * vs_TEXCOORD0.y;
    u_xlat10 = u_xlat10 * 9.96000004 + -1.42999995;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat2.xyz = (-_ColorDark.xyz) + _ColorLight.xyz;
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz + _ColorDark.xyz;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ClipRect;
uniform 	vec4 _ColorDark;
uniform 	vec4 _ColorLight;
UNITY_LOCATION(0) uniform mediump sampler2D _Speedlines1;
UNITY_LOCATION(1) uniform mediump sampler2D _Speedlines2;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_5;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.0250000004, 0.800000012);
    u_xlat0.xy = _Time.yy * vec2(0.300000012, -0.0299999993) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Speedlines2, u_xlat0.xy).xyz;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat2.xz = vs_TEXCOORD0.xy * vec2(0.00999999978, 0.5) + vec2(0.300000012, 0.0);
    u_xlat2.xz = _Time.yy * vec2(0.100000001, 0.0500000007) + u_xlat2.xz;
    u_xlat16_2.xz = texture(_Speedlines2, u_xlat2.xz).zw;
    u_xlat0.x = u_xlat16_2.x + u_xlat0.x;
    u_xlat2.x = u_xlat16_2.z + u_xlat16_0.z;
    u_xlat2.xyz = u_xlat2.xxx * vec3(0.00777109014, 0.0489586517, 0.140004829);
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.0472796746, 0.118688121, 0.23420532) + u_xlat2.xyz;
    u_xlat1 = _Time.yyyy * vec4(0.300000012, -0.0299999993, 0.349999994, 0.0500000007);
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.100000001, 1.5, 0.0500000007, 1.29999995) + u_xlat1;
    u_xlat16_5.xy = texture(_Speedlines1, u_xlat1.zw).yz;
    u_xlat16_1.xy = texture(_Speedlines1, u_xlat1.xy).xy;
    u_xlat6 = u_xlat16_1.y + u_xlat16_1.x;
    u_xlat1.x = u_xlat16_5.x + u_xlat16_5.y;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.0466265418, 0.293751895, 0.840029001);
    u_xlat1.xyz = vec3(u_xlat6) * vec3(0.0506732501, 0.179277509, 0.419999987) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = u_xlat6 * vs_TEXCOORD0.y;
    u_xlat6 = u_xlat6 * 9.96000004 + -1.42999995;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat1.xyz = (-_ColorDark.xyz) + _ColorLight.xyz;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + _ColorDark.xyz;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ClipRect;
uniform 	vec4 _ColorDark;
uniform 	vec4 _ColorLight;
UNITY_LOCATION(0) uniform mediump sampler2D _Speedlines1;
UNITY_LOCATION(1) uniform mediump sampler2D _Speedlines2;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec2 u_xlat16_3;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_11;
float u_xlat14;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = vs_COLOR0.w * u_xlat0.x + -0.00100000005;
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1<0.0);
#else
    u_xlatb2 = u_xlat16_1<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(0.0250000004, 0.800000012);
    u_xlat2.xy = _Time.yy * vec2(0.300000012, -0.0299999993) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_Speedlines2, u_xlat2.xy).xyz;
    u_xlat2.x = u_xlat16_2.y + u_xlat16_2.x;
    u_xlat6.xz = vs_TEXCOORD0.xy * vec2(0.00999999978, 0.5) + vec2(0.300000012, 0.0);
    u_xlat6.xz = _Time.yy * vec2(0.100000001, 0.0500000007) + u_xlat6.xz;
    u_xlat16_6.xz = texture(_Speedlines2, u_xlat6.xz).zw;
    u_xlat2.x = u_xlat16_6.x + u_xlat2.x;
    u_xlat6.x = u_xlat16_6.z + u_xlat16_2.z;
    u_xlat6.xyz = u_xlat6.xxx * vec3(0.00777109014, 0.0489586517, 0.140004829);
    u_xlat2.xyz = u_xlat2.xxx * vec3(0.0472796746, 0.118688121, 0.23420532) + u_xlat6.xyz;
    u_xlat1 = _Time.yyyy * vec4(0.300000012, -0.0299999993, 0.349999994, 0.0500000007);
    u_xlat1 = vs_TEXCOORD0.xyxy * vec4(0.100000001, 1.5, 0.0500000007, 1.29999995) + u_xlat1;
    u_xlat16_3.xy = texture(_Speedlines1, u_xlat1.zw).yz;
    u_xlat16_11.xy = texture(_Speedlines1, u_xlat1.xy).xy;
    u_xlat14 = u_xlat16_11.y + u_xlat16_11.x;
    u_xlat3.x = u_xlat16_3.x + u_xlat16_3.y;
    u_xlat3.xyz = u_xlat3.xxx * vec3(0.0466265418, 0.293751895, 0.840029001);
    u_xlat3.xyz = vec3(u_xlat14) * vec3(0.0506732501, 0.179277509, 0.419999987) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat14 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat14 = u_xlat14 * vs_TEXCOORD0.y;
    u_xlat14 = u_xlat14 * 9.96000004 + -1.42999995;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_ColorDark.xyz) + _ColorLight.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz + _ColorDark.xyz;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat2.xyz + u_xlat3.xyz;
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
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}