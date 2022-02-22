//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Swap" {
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
  GpuProgramID 27665
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
uniform 	float _SwapPerspective;
uniform 	float _SwapDepth;
uniform 	float _SwapReflection;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump float u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.x = _SwapDepth + -1.0;
    u_xlat6 = _T * u_xlat0.x + 1.0;
    u_xlat12.x = _T * _SwapPerspective;
    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(0.0, -0.5, -1.0, -0.5);
    u_xlat12.y = (-_SwapPerspective) * _T + 1.0;
    u_xlat12.x = u_xlat12.x * u_xlat6;
    u_xlat12.x = (-u_xlat12.x) * vs_TEXCOORD0.x + 1.0;
    u_xlat2.xy = vec2(u_xlat6) / u_xlat12.yx;
    u_xlat3.xy = u_xlat1.xy * u_xlat2.xy + vec2(0.0, 0.5);
    u_xlat6 = (-_T) + 1.0;
    u_xlat0.x = u_xlat6 * u_xlat0.x + 1.0;
    u_xlat12.x = u_xlat6 * _SwapPerspective;
    u_xlat6 = (-_SwapPerspective) * u_xlat6 + 1.0;
    u_xlat4.x = u_xlat0.x / u_xlat6;
    u_xlat6 = u_xlat12.x * u_xlat0.x;
    u_xlat16_5 = (-vs_TEXCOORD0.x) + 0.5;
    u_xlat6 = (-u_xlat6) * u_xlat16_5 + 1.0;
    u_xlat4.y = u_xlat0.x / u_xlat6;
    u_xlat0.xy = u_xlat1.zw * u_xlat4.xy + vec2(1.0, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_T<0.5);
#else
    u_xlatb1.x = _T<0.5;
#endif
    if(u_xlatb1.x){
        u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxyx).xz;
        u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
        u_xlatb2.xz = lessThan(u_xlat3.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
        u_xlatb13 = u_xlatb2.z && u_xlatb2.x;
        u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
        if(u_xlatb1.x){
            u_xlat2.xzw = texture(_MainTex, u_xlat3.xy).xyz;
        } else {
            u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xxyx).xz;
            u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
            u_xlatb4.xz = lessThan(u_xlat0.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
            u_xlatb13 = u_xlatb4.z && u_xlatb4.x;
            u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
            if(u_xlatb1.x){
                u_xlat2.xzw = texture(_SecondTex, u_xlat0.xy).xyz;
            } else {
                u_xlat3.z = (-u_xlat3.y);
                u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxzx).xz;
                u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
                u_xlatb4.xz = lessThan(u_xlat3.xxzx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
                u_xlatb13 = u_xlatb4.z && u_xlatb4.x;
                u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
                if(u_xlatb1.x){
                    u_xlat16_4.xzw = texture(_MainTex, u_xlat3.xz).xyz;
                    u_xlat1.x = u_xlat1.y * u_xlat2.y + 1.5;
                    u_xlat1.x = u_xlat1.x * _SwapReflection;
                    u_xlat2.xzw = u_xlat16_4.xzw * u_xlat1.xxx;
                } else {
                    u_xlat2.x = float(0.0);
                    u_xlat2.z = float(0.0);
                    u_xlat2.w = float(0.0);
                }
                u_xlat0.z = (-u_xlat0.y);
                u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xxzx).xz;
                u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
                u_xlatb4.xz = lessThan(u_xlat0.xxzx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
                u_xlatb13 = u_xlatb4.z && u_xlatb4.x;
                u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
                if(u_xlatb1.x){
                    u_xlat16_4.xzw = texture(_SecondTex, u_xlat0.xz).xyz;
                    u_xlat12.x = u_xlat1.w * u_xlat4.y + 1.5;
                    u_xlat12.x = u_xlat12.x * _SwapReflection;
                    u_xlat2.xzw = u_xlat12.xxx * u_xlat16_4.xzw + u_xlat2.xzw;
                }
            }
        }
    } else {
        u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb12 = u_xlatb1.z && u_xlatb1.x;
        u_xlatb1.xz = lessThan(u_xlat0.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
        u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
        u_xlatb12 = u_xlatb12 && u_xlatb1.x;
        if(u_xlatb12){
            u_xlat2.xzw = texture(_SecondTex, u_xlat0.xy).xyz;
        } else {
            u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxyx).xz;
            u_xlatb12 = u_xlatb1.z && u_xlatb1.x;
            u_xlatb1.xz = lessThan(u_xlat3.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
            u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
            u_xlatb12 = u_xlatb12 && u_xlatb1.x;
            if(u_xlatb12){
                u_xlat2.xzw = texture(_MainTex, u_xlat3.xy).xyz;
            } else {
                u_xlat3.w = (-u_xlat3.y);
                u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxwx).xz;
                u_xlatb12 = u_xlatb1.z && u_xlatb1.x;
                u_xlatb1.xz = lessThan(u_xlat3.xxwx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
                u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
                u_xlatb12 = u_xlatb12 && u_xlatb1.x;
                if(u_xlatb12){
                    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xw).xyz;
                    u_xlat12.x = u_xlat1.y * u_xlat2.y + 1.5;
                    u_xlat12.x = u_xlat12.x * _SwapReflection;
                    u_xlat2.xzw = u_xlat16_3.xyz * u_xlat12.xxx;
                } else {
                    u_xlat2.x = float(0.0);
                    u_xlat2.z = float(0.0);
                    u_xlat2.w = float(0.0);
                }
                u_xlat0.w = (-u_xlat0.y);
                u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xwxx).xy;
                u_xlatb6.x = u_xlatb6.y && u_xlatb6.x;
                u_xlatb1.xy = lessThan(u_xlat0.xwxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
                u_xlatb12 = u_xlatb1.y && u_xlatb1.x;
                u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
                if(u_xlatb6.x){
                    u_xlat16_0.xyz = texture(_SecondTex, u_xlat0.xw).xyz;
                    u_xlat18 = u_xlat1.w * u_xlat4.y + 1.5;
                    u_xlat18 = u_xlat18 * _SwapReflection;
                    u_xlat2.xzw = vec3(u_xlat18) * u_xlat16_0.xyz + u_xlat2.xzw;
                }
            }
        }
    }
    SV_Target0.xyz = u_xlat2.xzw;
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
uniform 	float _SwapPerspective;
uniform 	float _SwapDepth;
uniform 	float _SwapReflection;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump float u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.x = _SwapDepth + -1.0;
    u_xlat6 = _T * u_xlat0.x + 1.0;
    u_xlat12.x = _T * _SwapPerspective;
    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(0.0, -0.5, -1.0, -0.5);
    u_xlat12.y = (-_SwapPerspective) * _T + 1.0;
    u_xlat12.x = u_xlat12.x * u_xlat6;
    u_xlat12.x = (-u_xlat12.x) * vs_TEXCOORD0.x + 1.0;
    u_xlat2.xy = vec2(u_xlat6) / u_xlat12.yx;
    u_xlat3.xy = u_xlat1.xy * u_xlat2.xy + vec2(0.0, 0.5);
    u_xlat6 = (-_T) + 1.0;
    u_xlat0.x = u_xlat6 * u_xlat0.x + 1.0;
    u_xlat12.x = u_xlat6 * _SwapPerspective;
    u_xlat6 = (-_SwapPerspective) * u_xlat6 + 1.0;
    u_xlat4.x = u_xlat0.x / u_xlat6;
    u_xlat6 = u_xlat12.x * u_xlat0.x;
    u_xlat16_5 = (-vs_TEXCOORD0.x) + 0.5;
    u_xlat6 = (-u_xlat6) * u_xlat16_5 + 1.0;
    u_xlat4.y = u_xlat0.x / u_xlat6;
    u_xlat0.xy = u_xlat1.zw * u_xlat4.xy + vec2(1.0, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_T<0.5);
#else
    u_xlatb1.x = _T<0.5;
#endif
    if(u_xlatb1.x){
        u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxyx).xz;
        u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
        u_xlatb2.xz = lessThan(u_xlat3.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
        u_xlatb13 = u_xlatb2.z && u_xlatb2.x;
        u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
        if(u_xlatb1.x){
            u_xlat2.xzw = texture(_SecondTex, u_xlat3.xy).xyz;
        } else {
            u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xxyx).xz;
            u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
            u_xlatb4.xz = lessThan(u_xlat0.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
            u_xlatb13 = u_xlatb4.z && u_xlatb4.x;
            u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
            if(u_xlatb1.x){
                u_xlat2.xzw = texture(_MainTex, u_xlat0.xy).xyz;
            } else {
                u_xlat3.z = (-u_xlat3.y);
                u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxzx).xz;
                u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
                u_xlatb4.xz = lessThan(u_xlat3.xxzx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
                u_xlatb13 = u_xlatb4.z && u_xlatb4.x;
                u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
                if(u_xlatb1.x){
                    u_xlat16_4.xzw = texture(_SecondTex, u_xlat3.xz).xyz;
                    u_xlat1.x = u_xlat1.y * u_xlat2.y + 1.5;
                    u_xlat1.x = u_xlat1.x * _SwapReflection;
                    u_xlat2.xzw = u_xlat16_4.xzw * u_xlat1.xxx;
                } else {
                    u_xlat2.x = float(0.0);
                    u_xlat2.z = float(0.0);
                    u_xlat2.w = float(0.0);
                }
                u_xlat0.z = (-u_xlat0.y);
                u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xxzx).xz;
                u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
                u_xlatb4.xz = lessThan(u_xlat0.xxzx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
                u_xlatb13 = u_xlatb4.z && u_xlatb4.x;
                u_xlatb1.x = u_xlatb13 && u_xlatb1.x;
                if(u_xlatb1.x){
                    u_xlat16_4.xzw = texture(_MainTex, u_xlat0.xz).xyz;
                    u_xlat12.x = u_xlat1.w * u_xlat4.y + 1.5;
                    u_xlat12.x = u_xlat12.x * _SwapReflection;
                    u_xlat2.xzw = u_xlat12.xxx * u_xlat16_4.xzw + u_xlat2.xzw;
                }
            }
        }
    } else {
        u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb12 = u_xlatb1.z && u_xlatb1.x;
        u_xlatb1.xz = lessThan(u_xlat0.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
        u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
        u_xlatb12 = u_xlatb12 && u_xlatb1.x;
        if(u_xlatb12){
            u_xlat2.xzw = texture(_MainTex, u_xlat0.xy).xyz;
        } else {
            u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxyx).xz;
            u_xlatb12 = u_xlatb1.z && u_xlatb1.x;
            u_xlatb1.xz = lessThan(u_xlat3.xxyx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
            u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
            u_xlatb12 = u_xlatb12 && u_xlatb1.x;
            if(u_xlatb12){
                u_xlat2.xzw = texture(_SecondTex, u_xlat3.xy).xyz;
            } else {
                u_xlat3.w = (-u_xlat3.y);
                u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xxwx).xz;
                u_xlatb12 = u_xlatb1.z && u_xlatb1.x;
                u_xlatb1.xz = lessThan(u_xlat3.xxwx, vec4(1.0, 0.0, 1.0, 0.0)).xz;
                u_xlatb1.x = u_xlatb1.z && u_xlatb1.x;
                u_xlatb12 = u_xlatb12 && u_xlatb1.x;
                if(u_xlatb12){
                    u_xlat16_3.xyz = texture(_SecondTex, u_xlat3.xw).xyz;
                    u_xlat12.x = u_xlat1.y * u_xlat2.y + 1.5;
                    u_xlat12.x = u_xlat12.x * _SwapReflection;
                    u_xlat2.xzw = u_xlat16_3.xyz * u_xlat12.xxx;
                } else {
                    u_xlat2.x = float(0.0);
                    u_xlat2.z = float(0.0);
                    u_xlat2.w = float(0.0);
                }
                u_xlat0.w = (-u_xlat0.y);
                u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xwxx).xy;
                u_xlatb6.x = u_xlatb6.y && u_xlatb6.x;
                u_xlatb1.xy = lessThan(u_xlat0.xwxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
                u_xlatb12 = u_xlatb1.y && u_xlatb1.x;
                u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
                if(u_xlatb6.x){
                    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xw).xyz;
                    u_xlat18 = u_xlat1.w * u_xlat4.y + 1.5;
                    u_xlat18 = u_xlat18 * _SwapReflection;
                    u_xlat2.xzw = vec3(u_xlat18) * u_xlat16_0.xyz + u_xlat2.xzw;
                }
            }
        }
    }
    SV_Target0.xyz = u_xlat2.xzw;
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