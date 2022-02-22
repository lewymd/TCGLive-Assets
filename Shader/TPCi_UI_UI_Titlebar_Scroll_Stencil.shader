//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/UI/UI_Titlebar_Scroll_Stencil" {
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
_RColorMult ("R Color Mult", Float) = 25.71
_motecolormult ("mote color mult", Float) = 1
_MaskTexture ("Mask Texture", 2D) = "white" { }
_ColorGradient_Scroll ("ColorGradient_Scroll", 2D) = "white" { }
_DistortionTexture ("Distortion Texture", 2D) = "bump" { }
_ColorGradient_Motes ("ColorGradient_Motes", 2D) = "white" { }
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 34240
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
uniform 	float _RColorMult;
uniform 	float _motecolormult;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorGradient_Scroll;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ColorGradient_Motes;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat6;
mediump float u_xlat16_6;
vec2 u_xlat7;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(1.0, 0.5, -3.0, 0.649999976);
    u_xlat0 = _Time.yyyy * vec4(-0.25, 0.0500000007, 0.100000001, -0.300000012) + u_xlat0;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat6.xy = u_xlat16_0.xy * vec2(0.300000012, 0.300000012) + u_xlat0.zw;
    u_xlat16_6 = texture(_MaskTexture, u_xlat6.xy).z;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(-4.0, 0.5) + vec2(0.150000006, 0.0);
    u_xlat1.xy = _Time.yy * vec2(0.150000006, -0.150000006) + u_xlat1.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(0.200000003, 0.200000003) + u_xlat1.xy;
    u_xlat16_0.x = texture(_MaskTexture, u_xlat0.xy).y;
    u_xlat0.x = u_xlat16_6 + u_xlat16_0.x;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(-2.0, 1.0);
    u_xlat3.xy = _Time.yy * vec2(0.5, 0.0) + u_xlat3.xy;
    u_xlat1.xw = texture(_MaskTexture, u_xlat3.xy).xw;
    u_xlat7.x = u_xlat0.x * u_xlat1.w;
    u_xlat1.y = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat16_0 = texture(_ColorGradient_Motes, u_xlat7.xy);
    u_xlat0 = u_xlat16_0 * vec4(vec4(_motecolormult, _motecolormult, _motecolormult, _motecolormult));
    u_xlat0 = u_xlat0 * u_xlat7.xxxx;
    u_xlat16_2 = texture(_ColorGradient_Scroll, u_xlat1.xy);
    u_xlat2 = u_xlat16_2 * vec4(_RColorMult);
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    SV_Target0 = u_xlat0;
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
uniform 	float _RColorMult;
uniform 	float _motecolormult;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorGradient_Scroll;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ColorGradient_Motes;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(1.0, 0.5, -3.0, 0.649999976);
    u_xlat0 = _Time.yyyy * vec4(-0.25, 0.0500000007, 0.100000001, -0.300000012) + u_xlat0;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat8.xy = u_xlat16_0.xy * vec2(0.300000012, 0.300000012) + u_xlat0.zw;
    u_xlat16_8 = texture(_MaskTexture, u_xlat8.xy).z;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(-4.0, 0.5) + vec2(0.150000006, 0.0);
    u_xlat1.xy = _Time.yy * vec2(0.150000006, -0.150000006) + u_xlat1.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(0.200000003, 0.200000003) + u_xlat1.xy;
    u_xlat16_0.x = texture(_MaskTexture, u_xlat0.xy).y;
    u_xlat0.x = u_xlat16_8 + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(-2.0, 1.0);
    u_xlat4.xy = _Time.yy * vec2(0.5, 0.0) + u_xlat4.xy;
    u_xlat1.xw = texture(_MaskTexture, u_xlat4.xy).xw;
    u_xlat9.x = u_xlat0.x * u_xlat1.w;
    u_xlat1.y = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat16_0 = texture(_ColorGradient_Motes, u_xlat9.xy);
    u_xlat0 = u_xlat16_0 * vec4(vec4(_motecolormult, _motecolormult, _motecolormult, _motecolormult));
    u_xlat0 = u_xlat0 * u_xlat9.xxxx;
    u_xlat16_2 = texture(_ColorGradient_Scroll, u_xlat1.xy);
    u_xlat2 = u_xlat16_2 * vec4(_RColorMult);
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    u_xlat16_3 = u_xlat0.w + -0.00100000005;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3<0.0);
#else
    u_xlatb0 = u_xlat16_3<0.0;
#endif
    if(u_xlatb0){discard;}
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
uniform 	float _RColorMult;
uniform 	float _motecolormult;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorGradient_Scroll;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ColorGradient_Motes;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat6;
mediump float u_xlat16_6;
vec2 u_xlat7;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(1.0, 0.5, -3.0, 0.649999976);
    u_xlat0 = _Time.yyyy * vec4(-0.25, 0.0500000007, 0.100000001, -0.300000012) + u_xlat0;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat6.xy = u_xlat16_0.xy * vec2(0.300000012, 0.300000012) + u_xlat0.zw;
    u_xlat16_6 = texture(_MaskTexture, u_xlat6.xy).z;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(-4.0, 0.5) + vec2(0.150000006, 0.0);
    u_xlat1.xy = _Time.yy * vec2(0.150000006, -0.150000006) + u_xlat1.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(0.200000003, 0.200000003) + u_xlat1.xy;
    u_xlat16_0.x = texture(_MaskTexture, u_xlat0.xy).y;
    u_xlat0.x = u_xlat16_6 + u_xlat16_0.x;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(-2.0, 1.0);
    u_xlat3.xy = _Time.yy * vec2(0.5, 0.0) + u_xlat3.xy;
    u_xlat1.xw = texture(_MaskTexture, u_xlat3.xy).xw;
    u_xlat7.x = u_xlat0.x * u_xlat1.w;
    u_xlat1.y = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat16_0 = texture(_ColorGradient_Motes, u_xlat7.xy);
    u_xlat0 = u_xlat16_0 * vec4(vec4(_motecolormult, _motecolormult, _motecolormult, _motecolormult));
    u_xlat0 = u_xlat0 * u_xlat7.xxxx;
    u_xlat16_2 = texture(_ColorGradient_Scroll, u_xlat1.xy);
    u_xlat2 = u_xlat16_2 * vec4(_RColorMult);
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat0.w = u_xlat0.w * u_xlat1.x;
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
uniform 	float _RColorMult;
uniform 	float _motecolormult;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ColorGradient_Scroll;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ColorGradient_Motes;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(1.0, 0.5, -3.0, 0.649999976);
    u_xlat0 = _Time.yyyy * vec4(-0.25, 0.0500000007, 0.100000001, -0.300000012) + u_xlat0;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat8.xy = u_xlat16_0.xy * vec2(0.300000012, 0.300000012) + u_xlat0.zw;
    u_xlat16_8 = texture(_MaskTexture, u_xlat8.xy).z;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(-4.0, 0.5) + vec2(0.150000006, 0.0);
    u_xlat1.xy = _Time.yy * vec2(0.150000006, -0.150000006) + u_xlat1.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(0.200000003, 0.200000003) + u_xlat1.xy;
    u_xlat16_0.x = texture(_MaskTexture, u_xlat0.xy).y;
    u_xlat0.x = u_xlat16_8 + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(-2.0, 1.0);
    u_xlat4.xy = _Time.yy * vec2(0.5, 0.0) + u_xlat4.xy;
    u_xlat1.xw = texture(_MaskTexture, u_xlat4.xy).xw;
    u_xlat9.x = u_xlat0.x * u_xlat1.w;
    u_xlat1.y = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat16_0 = texture(_ColorGradient_Motes, u_xlat9.xy);
    u_xlat0 = u_xlat16_0 * vec4(vec4(_motecolormult, _motecolormult, _motecolormult, _motecolormult));
    u_xlat0 = u_xlat0 * u_xlat9.xxxx;
    u_xlat16_2 = texture(_ColorGradient_Scroll, u_xlat1.xy);
    u_xlat2 = u_xlat16_2 * vec4(_RColorMult);
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb1.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat16_3 = u_xlat0.w * u_xlat1.x + -0.00100000005;
    u_xlat0.w = u_xlat0.w * u_xlat1.x;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3<0.0);
#else
    u_xlatb0 = u_xlat16_3<0.0;
#endif
    if(u_xlatb0){discard;}
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