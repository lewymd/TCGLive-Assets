//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Cube" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_SecondTex ("Second (RGB)", 2D) = "white" { }
_T ("Amount", Range(0, 1)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 38891
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
uniform 	float _T;
uniform 	float _CubePerspective;
uniform 	float _CubeZoom;
uniform 	float _CubeReflection;
uniform 	float _CubeElevantion;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
bvec2 u_xlatb4;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = _CubeZoom + _CubeZoom;
    u_xlat4 = _T + -0.5;
    u_xlat4 = -abs(u_xlat4) + 0.5;
    u_xlat8.x = u_xlat4 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4 + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat8.xx * vec2(-0.5, -0.5) + u_xlat0.xy;
    u_xlat1.x = _T;
    u_xlat1.y = float(0.0);
    u_xlat9.y = float(1.0);
    u_xlat8.xy = u_xlat0.xy + (-u_xlat1.xy);
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat2.xy = u_xlat8.xy / u_xlat9.xy;
    u_xlat8.x = _CubePerspective * (-u_xlat1.x) + _T;
    u_xlat12 = (-u_xlat8.x) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat12 = (-u_xlat12) * 0.5 + u_xlat2.y;
    u_xlat8.x = (-u_xlat8.x) * u_xlat2.x + 1.0;
    u_xlat2.z = u_xlat12 / u_xlat8.x;
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxz).xy;
    u_xlatb8.x = u_xlatb8.y && u_xlatb8.x;
    u_xlatb1.xy = lessThan(u_xlat2.xzxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb12 = u_xlatb1.y && u_xlatb1.x;
    u_xlatb8.x = u_xlatb12 && u_xlatb8.x;
    if(u_xlatb8.x){
        u_xlat1.xyz = texture(_MainTex, u_xlat2.xz).xyz;
    } else {
        u_xlat3.x = _T;
        u_xlat3.y = 1.0;
        u_xlat0.xy = u_xlat0.xy / u_xlat3.xy;
        u_xlat8.x = _T * _T;
        u_xlat12 = (-_T) * _T + 1.0;
        u_xlat0.z = _CubePerspective * u_xlat12 + u_xlat8.x;
        u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
        u_xlat12 = u_xlat0.w * u_xlat0.x;
        u_xlat4 = (-u_xlat12) * 0.5 + u_xlat0.y;
        u_xlat8.x = u_xlat0.z + -1.0;
        u_xlat8.x = u_xlat8.x * u_xlat0.x + 1.0;
        u_xlat3.y = u_xlat4 / u_xlat8.x;
        u_xlat3.x = (-u_xlat0.x) + 1.0;
        u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyxx).xy;
        u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
        u_xlatb4.xy = lessThan(u_xlat3.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
        u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
        if(u_xlatb0.x){
            u_xlat1.xyz = texture(_SecondTex, u_xlat3.xy).xyz;
        } else {
            u_xlat2.w = u_xlat2.z * -1.20000005 + _CubeElevantion;
            u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xwxx).xy;
            u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
            u_xlatb4.xy = lessThan(u_xlat2.xwxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
            u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
            u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
            if(u_xlatb0.x){
                u_xlat16_0.xyz = texture(_MainTex, u_xlat2.xw).xyz;
                u_xlat12 = (-u_xlat2.w) + 1.0;
                u_xlat12 = u_xlat12 * _CubeReflection;
                u_xlat1.xyz = u_xlat16_0.xyz * vec3(u_xlat12);
            } else {
                u_xlat1.x = float(0.0);
                u_xlat1.y = float(0.0);
                u_xlat1.z = float(0.0);
            }
            u_xlat3.z = u_xlat3.y * -1.20000005 + _CubeElevantion;
            u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xzxx).xy;
            u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
            u_xlatb4.xy = lessThan(u_xlat3.xzxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
            u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
            u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
            if(u_xlatb0.x){
                u_xlat16_0.xyz = texture(_SecondTex, u_xlat3.xz).xyz;
                u_xlat12 = (-u_xlat3.z) + 1.0;
                u_xlat12 = u_xlat12 * _CubeReflection;
                u_xlat1.xyz = vec3(u_xlat12) * u_xlat16_0.xyz + u_xlat1.xyz;
            }
        }
    }
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "MODE_REVERSE" }
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
uniform 	float _T;
uniform 	float _CubePerspective;
uniform 	float _CubeZoom;
uniform 	float _CubeReflection;
uniform 	float _CubeElevantion;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
bvec2 u_xlatb4;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = _CubeZoom + _CubeZoom;
    u_xlat4 = _T + -0.5;
    u_xlat4 = -abs(u_xlat4) + 0.5;
    u_xlat8.x = u_xlat4 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4 + 1.0;
    u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat8.xx * vec2(-0.5, -0.5) + u_xlat0.xy;
    u_xlat1.x = _T;
    u_xlat1.y = float(0.0);
    u_xlat9.y = float(1.0);
    u_xlat8.xy = u_xlat0.xy + (-u_xlat1.xy);
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat2.xy = u_xlat8.xy / u_xlat9.xy;
    u_xlat8.x = _CubePerspective * (-u_xlat1.x) + _T;
    u_xlat12 = (-u_xlat8.x) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat12 = (-u_xlat12) * 0.5 + u_xlat2.y;
    u_xlat8.x = (-u_xlat8.x) * u_xlat2.x + 1.0;
    u_xlat2.z = u_xlat12 / u_xlat8.x;
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxz).xy;
    u_xlatb8.x = u_xlatb8.y && u_xlatb8.x;
    u_xlatb1.xy = lessThan(u_xlat2.xzxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb12 = u_xlatb1.y && u_xlatb1.x;
    u_xlatb8.x = u_xlatb12 && u_xlatb8.x;
    if(u_xlatb8.x){
        u_xlat1.xyz = texture(_SecondTex, u_xlat2.xz).xyz;
    } else {
        u_xlat3.x = _T;
        u_xlat3.y = 1.0;
        u_xlat0.xy = u_xlat0.xy / u_xlat3.xy;
        u_xlat8.x = _T * _T;
        u_xlat12 = (-_T) * _T + 1.0;
        u_xlat0.z = _CubePerspective * u_xlat12 + u_xlat8.x;
        u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
        u_xlat12 = u_xlat0.w * u_xlat0.x;
        u_xlat4 = (-u_xlat12) * 0.5 + u_xlat0.y;
        u_xlat8.x = u_xlat0.z + -1.0;
        u_xlat8.x = u_xlat8.x * u_xlat0.x + 1.0;
        u_xlat3.y = u_xlat4 / u_xlat8.x;
        u_xlat3.x = (-u_xlat0.x) + 1.0;
        u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyxx).xy;
        u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
        u_xlatb4.xy = lessThan(u_xlat3.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
        u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
        if(u_xlatb0.x){
            u_xlat1.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        } else {
            u_xlat2.w = u_xlat2.z * -1.20000005 + _CubeElevantion;
            u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xwxx).xy;
            u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
            u_xlatb4.xy = lessThan(u_xlat2.xwxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
            u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
            u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
            if(u_xlatb0.x){
                u_xlat16_0.xyz = texture(_SecondTex, u_xlat2.xw).xyz;
                u_xlat12 = (-u_xlat2.w) + 1.0;
                u_xlat12 = u_xlat12 * _CubeReflection;
                u_xlat1.xyz = u_xlat16_0.xyz * vec3(u_xlat12);
            } else {
                u_xlat1.x = float(0.0);
                u_xlat1.y = float(0.0);
                u_xlat1.z = float(0.0);
            }
            u_xlat3.z = u_xlat3.y * -1.20000005 + _CubeElevantion;
            u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xzxx).xy;
            u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
            u_xlatb4.xy = lessThan(u_xlat3.xzxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
            u_xlatb4.x = u_xlatb4.y && u_xlatb4.x;
            u_xlatb0.x = u_xlatb4.x && u_xlatb0.x;
            if(u_xlatb0.x){
                u_xlat16_0.xyz = texture(_MainTex, u_xlat3.xz).xyz;
                u_xlat12 = (-u_xlat3.z) + 1.0;
                u_xlat12 = u_xlat12 * _CubeReflection;
                u_xlat1.xyz = vec3(u_xlat12) * u_xlat16_0.xyz + u_xlat1.xyz;
            }
        }
    }
    SV_Target0.xyz = u_xlat1.xyz;
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
Keywords { "MODE_REVERSE" }
""
}
}
}
}
Fallback "Transition Fallback"
}