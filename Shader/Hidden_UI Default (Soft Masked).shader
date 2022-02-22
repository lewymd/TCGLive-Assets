//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI Default (Soft Masked)" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_SoftMask ("Mask", 2D) = "white" { }
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 54788
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_SoftMask_Rect.xy);
    u_xlat4.xy = (-_SoftMask_Rect.xy) + _SoftMask_Rect.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
    u_xlatb4.xy = notEqual(u_xlat4.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat0.x = u_xlatb4.x ? u_xlat0.x : 0.0;
    u_xlat0.y = u_xlatb4.y ? u_xlat0.y : 0.0;
;
    u_xlat4.xy = (-_SoftMask_UVRect.xy) + _SoftMask_UVRect.zw;
    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy + _SoftMask_UVRect.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat2.x : u_xlat0.x;
    u_xlat2.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat2.y + u_xlat0.x;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat2.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat2.z = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.w = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.zwzw * _SoftMask_BorderRect;
    u_xlat2 = u_xlat2 * _SoftMask_UVBorderRect;
    u_xlat8.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat9.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat9.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat8.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat8.xy;
    u_xlat8.xy = (-u_xlat9.xy) + u_xlat8.xy;
    u_xlat9.xy = (-u_xlat9.xy) + vs_TEXCOORD2.xy;
    u_xlat9.xy = u_xlat9.xy / u_xlat8.xy;
    u_xlatb8.xy = notEqual(u_xlat8.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? u_xlat9.x : 0.0;
    u_xlat8.y = u_xlatb8.y ? u_xlat9.y : 0.0;
;
    u_xlat9.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat2.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat4.x : u_xlat0.x;
    u_xlat4.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat4.y + u_xlat0.x;
    u_xlatb8.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xy;
    u_xlat8.x = u_xlat8.y * u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x + u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	vec2 _SoftMask_TileRepeat;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.xyxy * _SoftMask_BorderRect;
    u_xlat8.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat9.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat9.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat8.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat8.xy;
    u_xlat8.xy = (-u_xlat9.xy) + u_xlat8.xy;
    u_xlat9.xy = (-u_xlat9.xy) + vs_TEXCOORD2.xy;
    u_xlat9.xy = u_xlat9.xy / u_xlat8.xy;
    u_xlat10.xy = u_xlat2.xy * _SoftMask_TileRepeat.xy;
    u_xlat3 = u_xlat2.xyxy * _SoftMask_UVBorderRect;
    u_xlat2.xy = u_xlat9.xy * u_xlat10.xy;
    u_xlat8.xy = u_xlat8.xy * u_xlat10.xy;
    u_xlatb8.xy = notEqual(u_xlat8.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat8.x = (u_xlatb8.x) ? u_xlat2.x : u_xlat9.x;
    u_xlat8.y = (u_xlatb8.y) ? u_xlat2.y : u_xlat9.y;
    u_xlat9.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat4.x : u_xlat0.x;
    u_xlat4.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat4.y + u_xlat0.x;
    u_xlatb8.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xy;
    u_xlat8.x = u_xlat8.y * u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x + u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_SoftMask_Rect.xy);
    u_xlat6.xy = (-_SoftMask_Rect.xy) + _SoftMask_Rect.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat6.xy;
    u_xlatb6.xy = notEqual(u_xlat6.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat0.x = u_xlatb6.x ? u_xlat0.x : 0.0;
    u_xlat0.y = u_xlatb6.y ? u_xlat0.y : 0.0;
;
    u_xlat6.xy = (-_SoftMask_UVRect.xy) + _SoftMask_UVRect.zw;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy + _SoftMask_UVRect.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat3.x : u_xlat0.x;
    u_xlat3.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat3.y + u_xlat0.x;
    u_xlatb6.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x + u_xlat3.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2<0.0);
#else
    u_xlatb0 = u_xlat16_2<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec2 u_xlat10;
bvec2 u_xlatb10;
vec2 u_xlat11;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat2.z = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.w = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.zwzw * _SoftMask_BorderRect;
    u_xlat2 = u_xlat2 * _SoftMask_UVBorderRect;
    u_xlat10.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat11.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat11.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat10.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat10.xy;
    u_xlat10.xy = (-u_xlat11.xy) + u_xlat10.xy;
    u_xlat11.xy = (-u_xlat11.xy) + vs_TEXCOORD2.xy;
    u_xlat11.xy = u_xlat11.xy / u_xlat10.xy;
    u_xlatb10.xy = notEqual(u_xlat10.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat10.x = u_xlatb10.x ? u_xlat11.x : 0.0;
    u_xlat10.y = u_xlatb10.y ? u_xlat11.y : 0.0;
;
    u_xlat11.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat2.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat5.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat5.x : u_xlat0.x;
    u_xlat5.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlatb10.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat10.x = u_xlatb10.x ? float(1.0) : 0.0;
    u_xlat10.y = u_xlatb10.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat10.xy = u_xlat10.xy * u_xlat1.xy;
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x + u_xlat5.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_4 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_4<0.0);
#else
    u_xlatb0.x = u_xlat16_4<0.0;
#endif
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	vec2 _SoftMask_TileRepeat;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
vec4 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec2 u_xlat10;
bvec2 u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.xyxy * _SoftMask_BorderRect;
    u_xlat10.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat11.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat11.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat10.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat10.xy;
    u_xlat10.xy = (-u_xlat11.xy) + u_xlat10.xy;
    u_xlat11.xy = (-u_xlat11.xy) + vs_TEXCOORD2.xy;
    u_xlat11.xy = u_xlat11.xy / u_xlat10.xy;
    u_xlat12.xy = u_xlat2.xy * _SoftMask_TileRepeat.xy;
    u_xlat3 = u_xlat2.xyxy * _SoftMask_UVBorderRect;
    u_xlat2.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat10.xy = u_xlat10.xy * u_xlat12.xy;
    u_xlatb10.xy = notEqual(u_xlat10.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat10.x = (u_xlatb10.x) ? u_xlat2.x : u_xlat11.x;
    u_xlat10.y = (u_xlatb10.y) ? u_xlat2.y : u_xlat11.y;
    u_xlat11.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat5.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat5.x : u_xlat0.x;
    u_xlat5.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlatb10.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat10.x = u_xlatb10.x ? float(1.0) : 0.0;
    u_xlat10.y = u_xlatb10.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat10.xy = u_xlat10.xy * u_xlat1.xy;
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x + u_xlat5.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_4 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_4<0.0);
#else
    u_xlatb0.x = u_xlat16_4<0.0;
#endif
    if(u_xlatb0.x){discard;}
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
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
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
vec2 u_xlat6;
bvec2 u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_SoftMask_Rect.xy);
    u_xlat6.xy = (-_SoftMask_Rect.xy) + _SoftMask_Rect.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat6.xy;
    u_xlatb6.xy = notEqual(u_xlat6.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat0.x = u_xlatb6.x ? u_xlat0.x : 0.0;
    u_xlat0.y = u_xlatb6.y ? u_xlat0.y : 0.0;
;
    u_xlat6.xy = (-_SoftMask_UVRect.xy) + _SoftMask_UVRect.zw;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy + _SoftMask_UVRect.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat3.x : u_xlat0.x;
    u_xlat3.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat3.y + u_xlat0.x;
    u_xlatb6.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat6.x = u_xlatb6.x ? float(1.0) : 0.0;
    u_xlat6.y = u_xlatb6.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat6.xy = u_xlat6.xy * u_xlat1.xy;
    u_xlat6.x = u_xlat6.y * u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x + u_xlat3.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat1.w = u_xlat3.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
bvec2 u_xlatb4;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat2.z = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.w = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.zwzw * _SoftMask_BorderRect;
    u_xlat2 = u_xlat2 * _SoftMask_UVBorderRect;
    u_xlat8.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat9.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat9.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat8.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat8.xy;
    u_xlat8.xy = (-u_xlat9.xy) + u_xlat8.xy;
    u_xlat9.xy = (-u_xlat9.xy) + vs_TEXCOORD2.xy;
    u_xlat9.xy = u_xlat9.xy / u_xlat8.xy;
    u_xlatb8.xy = notEqual(u_xlat8.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat8.x = u_xlatb8.x ? u_xlat9.x : 0.0;
    u_xlat8.y = u_xlatb8.y ? u_xlat9.y : 0.0;
;
    u_xlat9.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat2.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat4.x : u_xlat0.x;
    u_xlat4.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat4.y + u_xlat0.x;
    u_xlatb8.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xy;
    u_xlat8.x = u_xlat8.y * u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x + u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat1.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	vec2 _SoftMask_TileRepeat;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
vec2 u_xlat4;
bvec2 u_xlatb4;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.xyxy * _SoftMask_BorderRect;
    u_xlat8.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat9.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat9.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat8.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat8.xy;
    u_xlat8.xy = (-u_xlat9.xy) + u_xlat8.xy;
    u_xlat9.xy = (-u_xlat9.xy) + vs_TEXCOORD2.xy;
    u_xlat9.xy = u_xlat9.xy / u_xlat8.xy;
    u_xlat10.xy = u_xlat2.xy * _SoftMask_TileRepeat.xy;
    u_xlat3 = u_xlat2.xyxy * _SoftMask_UVBorderRect;
    u_xlat2.xy = u_xlat9.xy * u_xlat10.xy;
    u_xlat8.xy = u_xlat8.xy * u_xlat10.xy;
    u_xlatb8.xy = notEqual(u_xlat8.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat8.x = (u_xlatb8.x) ? u_xlat2.x : u_xlat9.x;
    u_xlat8.y = (u_xlatb8.y) ? u_xlat2.y : u_xlat9.y;
    u_xlat9.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat9.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat4.x : u_xlat0.x;
    u_xlat4.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat4.y + u_xlat0.x;
    u_xlatb8.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xy;
    u_xlat8.x = u_xlat8.y * u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x + u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat1.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
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
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2<0.0);
#else
    u_xlatb0.x = u_xlat16_2<0.0;
#endif
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec2 u_xlat4;
bvec2 u_xlatb4;
vec2 u_xlat8;
bvec2 u_xlatb8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy + (-_SoftMask_Rect.xy);
    u_xlat8.xy = (-_SoftMask_Rect.xy) + _SoftMask_Rect.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat8.xy;
    u_xlatb8.xy = notEqual(u_xlat8.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat0.x = u_xlatb8.x ? u_xlat0.x : 0.0;
    u_xlat0.y = u_xlatb8.y ? u_xlat0.y : 0.0;
;
    u_xlat8.xy = (-_SoftMask_UVRect.xy) + _SoftMask_UVRect.zw;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy + _SoftMask_UVRect.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat4.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat4.x : u_xlat0.x;
    u_xlat4.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat4.y + u_xlat0.x;
    u_xlatb8.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat8.x = u_xlatb8.x ? float(1.0) : 0.0;
    u_xlat8.y = u_xlatb8.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xy;
    u_xlat8.x = u_xlat8.y * u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x + u_xlat4.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xy;
    u_xlat4.x = u_xlat4.y * u_xlat4.x;
    u_xlat16_3 = u_xlat0.x * u_xlat4.x + -0.00100000005;
    u_xlat1.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
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
Keywords { "SOFTMASK_SLICED" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat5;
bvec2 u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
vec2 u_xlat11;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat2.z = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.w = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.zwzw * _SoftMask_BorderRect;
    u_xlat2 = u_xlat2 * _SoftMask_UVBorderRect;
    u_xlat10.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat11.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat11.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat10.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat10.xy;
    u_xlat10.xy = (-u_xlat11.xy) + u_xlat10.xy;
    u_xlat11.xy = (-u_xlat11.xy) + vs_TEXCOORD2.xy;
    u_xlat11.xy = u_xlat11.xy / u_xlat10.xy;
    u_xlatb10.xy = notEqual(u_xlat10.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat10.x = u_xlatb10.x ? u_xlat11.x : 0.0;
    u_xlat10.y = u_xlatb10.y ? u_xlat11.y : 0.0;
;
    u_xlat11.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat2.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat5.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat5.x : u_xlat0.x;
    u_xlat5.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlatb10.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat10.x = u_xlatb10.x ? float(1.0) : 0.0;
    u_xlat10.y = u_xlatb10.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat10.xy = u_xlat10.xy * u_xlat1.xy;
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x + u_xlat5.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb5.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat16_4 = u_xlat0.x * u_xlat5.x + -0.00100000005;
    u_xlat1.w = u_xlat5.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_4<0.0);
#else
    u_xlatb0.x = u_xlat16_4<0.0;
#endif
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4_SoftMask_WorldToMask[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4_SoftMask_WorldToMask[1];
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4_SoftMask_WorldToMask[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD2 = hlslcc_mtx4x4_SoftMask_WorldToMask[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _SoftMask_Rect;
uniform 	vec4 _SoftMask_UVRect;
uniform 	vec4 _SoftMask_ChannelWeights;
uniform 	vec4 _SoftMask_BorderRect;
uniform 	vec4 _SoftMask_UVBorderRect;
uniform 	vec2 _SoftMask_TileRepeat;
uniform 	int _SoftMask_InvertMask;
uniform 	int _SoftMask_InvertOutsides;
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SoftMask;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec2 u_xlati0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat5;
bvec2 u_xlatb5;
vec2 u_xlat10;
bvec2 u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlatb0 = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_BorderRect);
    u_xlat1.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat2.x = (u_xlatb0.z) ? float(0.0) : u_xlat1.x;
    u_xlat2.y = (u_xlatb0.w) ? float(0.0) : u_xlat1.y;
    u_xlat1.xy = u_xlat1.zw * u_xlat1.xy;
    u_xlati0.xy = ivec2(uvec2((uint(u_xlatb0.x) * 0xffffffffu) | (uint(u_xlatb0.z) * 0xffffffffu), (uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.w) * 0xffffffffu)));
    u_xlat0.x = (u_xlati0.x != 0) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlati0.y != 0) ? float(0.0) : float(1.0);
    u_xlat3 = u_xlat2.xyxy * _SoftMask_BorderRect;
    u_xlat10.xy = _SoftMask_BorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat11.xy = _SoftMask_Rect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat11.xy = _SoftMask_BorderRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat10.xy = _SoftMask_Rect.zw * u_xlat1.xy + u_xlat10.xy;
    u_xlat10.xy = (-u_xlat11.xy) + u_xlat10.xy;
    u_xlat11.xy = (-u_xlat11.xy) + vs_TEXCOORD2.xy;
    u_xlat11.xy = u_xlat11.xy / u_xlat10.xy;
    u_xlat12.xy = u_xlat2.xy * _SoftMask_TileRepeat.xy;
    u_xlat3 = u_xlat2.xyxy * _SoftMask_UVBorderRect;
    u_xlat2.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat10.xy = u_xlat10.xy * u_xlat12.xy;
    u_xlatb10.xy = notEqual(u_xlat10.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat10.x = (u_xlatb10.x) ? u_xlat2.x : u_xlat11.x;
    u_xlat10.y = (u_xlatb10.y) ? u_xlat2.y : u_xlat11.y;
    u_xlat11.xy = _SoftMask_UVBorderRect.xy * u_xlat0.xy + u_xlat3.zw;
    u_xlat0.xy = _SoftMask_UVRect.xy * u_xlat0.xy + u_xlat3.xy;
    u_xlat0.xy = _SoftMask_UVBorderRect.zw * u_xlat1.xy + u_xlat0.xy;
    u_xlat1.xy = _SoftMask_UVRect.zw * u_xlat1.xy + u_xlat11.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat0.xy = u_xlat10.xy * u_xlat1.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_SoftMask, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _SoftMask_ChannelWeights;
    u_xlat0.x = dot(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat5.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (_SoftMask_InvertMask != 0) ? u_xlat5.x : u_xlat0.x;
    u_xlat5.xy = (int(_SoftMask_InvertOutsides) != 0) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat0.x = u_xlat5.y + u_xlat0.x;
    u_xlatb10.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, _SoftMask_Rect.xyxy).xy;
    u_xlat10.x = u_xlatb10.x ? float(1.0) : 0.0;
    u_xlat10.y = u_xlatb10.y ? float(1.0) : 0.0;
;
    u_xlatb1.xy = greaterThanEqual(_SoftMask_Rect.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
;
    u_xlat10.xy = u_xlat10.xy * u_xlat1.xy;
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x + u_xlat5.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb5.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat5.x = u_xlatb5.x ? float(1.0) : 0.0;
    u_xlat5.y = u_xlatb5.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat5.xy = u_xlat5.xy * u_xlat2.xy;
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat16_4 = u_xlat0.x * u_xlat5.x + -0.00100000005;
    u_xlat1.w = u_xlat5.x * u_xlat0.x;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_4<0.0);
#else
    u_xlatb0.x = u_xlat16_4<0.0;
#endif
    if(u_xlatb0.x){discard;}
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
Keywords { "SOFTMASK_SIMPLE" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SIMPLE" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_SLICED" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 " {
Keywords { "SOFTMASK_TILED" "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
}