//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Vuplex/Viewport Shader" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
[Toggle(FLIP_X)] _FlipX ("Flip X", Float) = 0
[Toggle(FLIP_Y)] _FlipY ("Flip Y", Float) = 0
[Header(Properties set programmatically)] _VideoCutoutRect ("Video Cutout Rect", Vector) = (0,0,0,0)
_CropRect ("Crop Rect", Vector) = (0,0,0,0)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 39510
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _VideoCutoutRect;
uniform 	vec4 _CropRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
bvec2 u_xlatb4;
bool u_xlatb8;
bool u_xlatb12;
void main()
{
    u_xlatb0.xy = notEqual(_VideoCutoutRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(vs_TEXCOORD0.x>=_VideoCutoutRect.x);
#else
    u_xlatb4.x = vs_TEXCOORD0.x>=_VideoCutoutRect.x;
#endif
    u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
    u_xlat4.xy = _VideoCutoutRect.zw + _VideoCutoutRect.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat4.x>=vs_TEXCOORD0.x);
#else
    u_xlatb4.x = u_xlat4.x>=vs_TEXCOORD0.x;
#endif
    u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
    u_xlat4.x = (-vs_TEXCOORD0.y) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat4.x>=_VideoCutoutRect.y);
#else
    u_xlatb12 = u_xlat4.x>=_VideoCutoutRect.y;
#endif
    u_xlatb0.x = u_xlatb12 && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.y>=u_xlat4.x);
#else
    u_xlatb8 = u_xlat4.y>=u_xlat4.x;
#endif
    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb2.xyz = lessThan(u_xlat1.xyzx, vec4(0.150000006, 0.150000006, 0.150000006, 0.0)).xyz;
    u_xlatb8 = u_xlatb2.y && u_xlatb2.x;
    u_xlatb8 = u_xlatb2.z && u_xlatb8;
    u_xlat16_2 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
    u_xlat16_1 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat4.x<_CropRect.y);
#else
    u_xlatb0.x = u_xlat4.x<_CropRect.y;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(vs_TEXCOORD0.x<_CropRect.x);
#else
    u_xlatb8 = vs_TEXCOORD0.x<_CropRect.x;
#endif
    u_xlat3.xy = _CropRect.zw + _CropRect.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat3.x<vs_TEXCOORD0.x);
#else
    u_xlatb12 = u_xlat3.x<vs_TEXCOORD0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat3.y<u_xlat4.x);
#else
    u_xlatb4.x = u_xlat3.y<u_xlat4.x;
#endif
    u_xlatb8 = u_xlatb12 || u_xlatb8;
    u_xlatb0.x = u_xlatb0.x || u_xlatb8;
    u_xlatb0.x = u_xlatb4.x || u_xlatb0.x;
    u_xlatb4.xy = notEqual(_CropRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
    u_xlatb0.x = u_xlatb0.x && u_xlatb4.x;
    u_xlat16_0 = (u_xlatb0.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat16_1;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat1.w = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "FLIP_Y" }
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _VideoCutoutRect;
uniform 	vec4 _CropRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
bvec3 u_xlatb3;
bvec2 u_xlatb4;
bvec2 u_xlatb7;
void main()
{
    u_xlatb0.xy = notEqual(_VideoCutoutRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _VideoCutoutRect.xyxx).xy;
    u_xlatb0.x = u_xlatb3.x && u_xlatb0.x;
    u_xlat3.xz = _VideoCutoutRect.zw + _VideoCutoutRect.xy;
    u_xlatb3.xz = greaterThanEqual(u_xlat3.xxzz, vs_TEXCOORD0.xxyy).xz;
    u_xlatb0.x = u_xlatb3.x && u_xlatb0.x;
    u_xlatb0.x = u_xlatb3.y && u_xlatb0.x;
    u_xlatb0.x = u_xlatb3.z && u_xlatb0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb3.xyz = lessThan(u_xlat1.xyzz, vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006)).xyz;
    u_xlatb3.x = u_xlatb3.y && u_xlatb3.x;
    u_xlatb3.x = u_xlatb3.z && u_xlatb3.x;
    u_xlat16_2 = (u_xlatb3.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat1;
    u_xlat1.xy = _CropRect.zw + _CropRect.xy;
    u_xlatb1.xy = lessThan(u_xlat1.xyxx, vs_TEXCOORD0.xyxx).xy;
    u_xlatb7.xy = lessThan(vs_TEXCOORD0.xyxy, _CropRect.xyxy).xy;
    u_xlatb1.x = u_xlatb1.x || u_xlatb7.x;
    u_xlatb1.x = u_xlatb7.y || u_xlatb1.x;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlatb4.xy = notEqual(_CropRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
    u_xlatb1.x = u_xlatb1.x && u_xlatb4.x;
    u_xlat16_0 = (u_xlatb1.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat16_0;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat1.w = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" }
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _VideoCutoutRect;
uniform 	vec4 _CropRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec3 u_xlatb1;
mediump vec4 u_xlat16_2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
bvec2 u_xlatb4;
bool u_xlatb12;
void main()
{
    u_xlatb0.xy = notEqual(_VideoCutoutRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat4.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
    u_xlatb1.xy = greaterThanEqual(u_xlat4.xyxx, _VideoCutoutRect.xyxx).xy;
    u_xlatb0.x = u_xlatb0.x && u_xlatb1.x;
    u_xlat1.xz = _VideoCutoutRect.zw + _VideoCutoutRect.xy;
    u_xlatb1.xz = greaterThanEqual(u_xlat1.xxzx, u_xlat4.xxyx).xz;
    u_xlatb0.x = u_xlatb0.x && u_xlatb1.x;
    u_xlatb0.x = u_xlatb1.y && u_xlatb0.x;
    u_xlatb0.x = u_xlatb1.z && u_xlatb0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb2.xyz = lessThan(u_xlat1.xyzx, vec4(0.150000006, 0.150000006, 0.150000006, 0.0)).xyz;
    u_xlatb12 = u_xlatb2.y && u_xlatb2.x;
    u_xlatb12 = u_xlatb2.z && u_xlatb12;
    u_xlat16_2 = (bool(u_xlatb12)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
    u_xlat16_1 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat1;
    u_xlat0.xw = _CropRect.zw + _CropRect.xy;
    u_xlatb0.xw = lessThan(u_xlat0.xxxw, u_xlat4.xxxy).xw;
    u_xlatb4.xy = lessThan(u_xlat4.xyxx, _CropRect.xyxx).xy;
    u_xlatb0.x = u_xlatb0.x || u_xlatb4.x;
    u_xlatb0.x = u_xlatb4.y || u_xlatb0.x;
    u_xlatb0.x = u_xlatb0.w || u_xlatb0.x;
    u_xlatb4.xy = notEqual(_CropRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
    u_xlatb0.x = u_xlatb0.x && u_xlatb4.x;
    u_xlat16_0 = (u_xlatb0.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat16_1;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat1.w = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "FLIP_Y" }
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = (-in_TEXCOORD0.xy) + vec2(1.0, 1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _VideoCutoutRect;
uniform 	vec4 _CropRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
bvec3 u_xlatb2;
vec3 u_xlat3;
float u_xlat4;
bvec2 u_xlatb4;
vec2 u_xlat8;
bool u_xlatb8;
bool u_xlatb12;
void main()
{
    u_xlatb0.xy = notEqual(_VideoCutoutRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat4 = (-vs_TEXCOORD0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4>=_VideoCutoutRect.x);
#else
    u_xlatb8 = u_xlat4>=_VideoCutoutRect.x;
#endif
    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
    u_xlat8.xy = _VideoCutoutRect.zw + _VideoCutoutRect.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=u_xlat4);
#else
    u_xlatb8 = u_xlat8.x>=u_xlat4;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat8.y>=vs_TEXCOORD0.y);
#else
    u_xlatb12 = u_xlat8.y>=vs_TEXCOORD0.y;
#endif
    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(vs_TEXCOORD0.y>=_VideoCutoutRect.y);
#else
    u_xlatb8 = vs_TEXCOORD0.y>=_VideoCutoutRect.y;
#endif
    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
    u_xlatb0.x = u_xlatb12 && u_xlatb0.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb2.xyz = lessThan(u_xlat1.xyzx, vec4(0.150000006, 0.150000006, 0.150000006, 0.0)).xyz;
    u_xlatb8 = u_xlatb2.y && u_xlatb2.x;
    u_xlatb8 = u_xlatb2.z && u_xlatb8;
    u_xlat16_2 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
    u_xlat16_1 = (u_xlatb0.x) ? u_xlat16_2 : u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat4<_CropRect.x);
#else
    u_xlatb0.x = u_xlat4<_CropRect.x;
#endif
    u_xlat8.xy = _CropRect.zw + _CropRect.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat8.x<u_xlat4);
#else
    u_xlatb4.x = u_xlat8.x<u_xlat4;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.y<vs_TEXCOORD0.y);
#else
    u_xlatb8 = u_xlat8.y<vs_TEXCOORD0.y;
#endif
    u_xlatb0.x = u_xlatb4.x || u_xlatb0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(vs_TEXCOORD0.y<_CropRect.y);
#else
    u_xlatb4.x = vs_TEXCOORD0.y<_CropRect.y;
#endif
    u_xlatb0.x = u_xlatb4.x || u_xlatb0.x;
    u_xlatb0.x = u_xlatb8 || u_xlatb0.x;
    u_xlatb4.xy = notEqual(_CropRect.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
    u_xlatb0.x = u_xlatb0.x && u_xlatb4.x;
    u_xlat16_0 = (u_xlatb0.x) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat16_1;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat1.w = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
Keywords { "FLIP_Y" }
""
}
SubProgram "gles3 " {
Keywords { "FLIP_X" }
""
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "FLIP_Y" }
""
}
}
}
}
Fallback "Unlit/Texture"
}