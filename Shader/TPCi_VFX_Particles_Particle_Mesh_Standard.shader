//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Mesh_Standard" {
Properties {
_Diffuse ("Diffuse", 2D) = "white" { }
_DiffuseTiling ("Diffuse Tiling", Vector) = (1,1,0,0)
_DiffuseOffset ("Diffuse Offset", Vector) = (0,0,0,0)
_Metallic ("Metallic", 2D) = "white" { }
_MetallicAmount ("Metallic Amount", Float) = 0
_MetallicTiling ("Metallic Tiling", Vector) = (1,1,0,0)
_MetallicOffset ("Metallic Offset", Vector) = (0,0,0,0)
_Smoothness ("Smoothness", 2D) = "white" { }
_SmoothnessAmount ("Smoothness Amount", Float) = 0
_SmoothnessTiling ("Smoothness Tiling", Vector) = (1,1,0,0)
_SmoothnessOffset ("Smoothness Offset", Vector) = (0,0,0,0)
_Emissive ("Emissive", 2D) = "white" { }
_EmissiveAmount ("Emissive Amount", Float) = 0
_EmissiveTiling ("Emissive Tiling", Vector) = (1,1,0,0)
_EmissiveOffset ("Emissive Offset", Vector) = (0,0,0,0)
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 51348
Program "vp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec2 _DiffuseTiling;
uniform 	vec2 _DiffuseOffset;
uniform 	vec2 _EmissiveTiling;
uniform 	vec2 _EmissiveOffset;
uniform 	float _EmissiveAmount;
uniform 	vec2 _MetallicTiling;
uniform 	vec2 _MetallicOffset;
uniform 	float _MetallicAmount;
uniform 	vec2 _SmoothnessTiling;
uniform 	vec2 _SmoothnessOffset;
uniform 	float _SmoothnessAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(2) uniform mediump sampler2D _Metallic;
UNITY_LOCATION(3) uniform mediump sampler2D _Smoothness;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
mediump float u_xlat16_9;
bvec3 u_xlatb10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
float u_xlat16;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_28;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
float u_xlat48;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTiling.xy + vec2(_DiffuseOffset.x, _DiffuseOffset.y);
    u_xlat16_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _EmissiveTiling.xy + vec2(_EmissiveOffset.x, _EmissiveOffset.y);
    u_xlat16_3.xyz = texture(_Emissive, u_xlat3.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_MetallicTiling.x, _MetallicTiling.y) + _MetallicOffset.xy;
    u_xlat16_46 = texture(_Metallic, u_xlat4.xy).x;
    u_xlat46 = u_xlat16_46 * _MetallicAmount;
    u_xlat4.xy = vs_TEXCOORD0.xy * _SmoothnessTiling.xy + vec2(_SmoothnessOffset.x, _SmoothnessOffset.y);
    u_xlat16_47 = texture(_Smoothness, u_xlat4.xy).x;
    u_xlat48 = (-u_xlat16_47) * _SmoothnessAmount + 1.0;
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb4 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb4){
        u_xlat4.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat4.x = inversesqrt(u_xlat4.x);
        u_xlat4.xyz = u_xlat4.xxx * u_xlat16_5.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat4.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat49 = min(u_xlat6.y, u_xlat6.x);
        u_xlat49 = min(u_xlat6.z, u_xlat49);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat49) + u_xlat6.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_50 = (-u_xlat48) * 0.699999988 + 1.70000005;
    u_xlat16_50 = u_xlat48 * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 6.0;
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, u_xlat16_50);
    u_xlat16_9 = u_xlat16_4.w + -1.0;
    u_xlat16_9 = unity_SpecCube0_HDR.w * u_xlat16_9 + 1.0;
    u_xlat16_9 = log2(u_xlat16_9);
    u_xlat16_9 = u_xlat16_9 * unity_SpecCube0_HDR.y;
    u_xlat16_9 = exp2(u_xlat16_9);
    u_xlat16_9 = u_xlat16_9 * unity_SpecCube0_HDR.x;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_9);
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb49){
#ifdef UNITY_ADRENO_ES3
        u_xlatb49 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat6.xyz = vec3(u_xlat49) * u_xlat16_5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat49 = min(u_xlat7.y, u_xlat7.x);
            u_xlat49 = min(u_xlat7.z, u_xlat49);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat49) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat16_50);
        u_xlat16_11.x = u_xlat16_5.w + -1.0;
        u_xlat16_11.x = unity_SpecCube1_HDR.w * u_xlat16_11.x + 1.0;
        u_xlat16_11.x = log2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * unity_SpecCube1_HDR.y;
        u_xlat16_11.x = exp2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * unity_SpecCube1_HDR.x;
        u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_11.xxx;
        u_xlat4.xyz = vec3(u_xlat16_9) * u_xlat16_4.xyz + (-u_xlat16_11.xyz);
        u_xlat24.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_11.xyz;
        u_xlat16_24.xyz = u_xlat24.xyz;
    }
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = vec3(u_xlat46) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9 = (-u_xlat46) * 0.959999979 + 0.959999979;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(u_xlat16_9);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat0.x + u_xlat0.x;
    u_xlat16_56 = u_xlat0.x * u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 * u_xlat48 + -0.5;
    u_xlat16_57 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + 1.0;
    u_xlat16_13 = -abs(u_xlat45) + 1.0;
    u_xlat16_28.x = u_xlat16_13 * u_xlat16_13;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_28.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_13 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat15 = u_xlat1.x * u_xlat16_56;
    u_xlat30 = u_xlat48 * u_xlat48;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_56 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_56!=0.0);
#else
    u_xlatb1 = u_xlat16_56!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat45 = u_xlat45 * u_xlat1.x;
    u_xlat16_9 = (-u_xlat16_9) + 1.0;
    u_xlat16_9 = u_xlat16_47 * _SmoothnessAmount + u_xlat16_9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat45) * _LightColor0.xyz;
    u_xlat16_56 = (-u_xlat0.x) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_14.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat16_56) + u_xlat16_11.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_14.xyz;
    u_xlat0.xyw = u_xlat16_12.xyz * u_xlat16_28.xyz + u_xlat0.xyw;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(u_xlat30);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(u_xlat16_9);
    u_xlat16_11.xyz = vec3(u_xlat16_13) * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_24.xyz * u_xlat16_11.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(_EmissiveAmount) + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec2 _DiffuseTiling;
uniform 	vec2 _DiffuseOffset;
uniform 	vec2 _EmissiveTiling;
uniform 	vec2 _EmissiveOffset;
uniform 	float _EmissiveAmount;
uniform 	vec2 _MetallicTiling;
uniform 	vec2 _MetallicOffset;
uniform 	float _MetallicAmount;
uniform 	vec2 _SmoothnessTiling;
uniform 	vec2 _SmoothnessOffset;
uniform 	float _SmoothnessAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(2) uniform mediump sampler2D _Metallic;
UNITY_LOCATION(3) uniform mediump sampler2D _Smoothness;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
mediump float u_xlat16_9;
bvec3 u_xlatb10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_13;
mediump vec3 u_xlat16_14;
float u_xlat15;
float u_xlat16;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_28;
float u_xlat30;
float u_xlat31;
float u_xlat45;
float u_xlat46;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
float u_xlat48;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat1.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTiling.xy + vec2(_DiffuseOffset.x, _DiffuseOffset.y);
    u_xlat16_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _EmissiveTiling.xy + vec2(_EmissiveOffset.x, _EmissiveOffset.y);
    u_xlat16_3.xyz = texture(_Emissive, u_xlat3.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_MetallicTiling.x, _MetallicTiling.y) + _MetallicOffset.xy;
    u_xlat16_46 = texture(_Metallic, u_xlat4.xy).x;
    u_xlat46 = u_xlat16_46 * _MetallicAmount;
    u_xlat4.xy = vs_TEXCOORD0.xy * _SmoothnessTiling.xy + vec2(_SmoothnessOffset.x, _SmoothnessOffset.y);
    u_xlat16_47 = texture(_Smoothness, u_xlat4.xy).x;
    u_xlat48 = (-u_xlat16_47) * _SmoothnessAmount + 1.0;
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb4 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb4){
        u_xlat4.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat4.x = inversesqrt(u_xlat4.x);
        u_xlat4.xyz = u_xlat4.xxx * u_xlat16_5.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat4.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat49 = min(u_xlat6.y, u_xlat6.x);
        u_xlat49 = min(u_xlat6.z, u_xlat49);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat49) + u_xlat6.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_50 = (-u_xlat48) * 0.699999988 + 1.70000005;
    u_xlat16_50 = u_xlat48 * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 6.0;
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, u_xlat16_50);
    u_xlat16_9 = u_xlat16_4.w + -1.0;
    u_xlat16_9 = unity_SpecCube0_HDR.w * u_xlat16_9 + 1.0;
    u_xlat16_9 = log2(u_xlat16_9);
    u_xlat16_9 = u_xlat16_9 * unity_SpecCube0_HDR.y;
    u_xlat16_9 = exp2(u_xlat16_9);
    u_xlat16_9 = u_xlat16_9 * unity_SpecCube0_HDR.x;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_9);
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb49 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb49){
#ifdef UNITY_ADRENO_ES3
        u_xlatb49 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb49 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat49 = inversesqrt(u_xlat49);
            u_xlat6.xyz = vec3(u_xlat49) * u_xlat16_5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat49 = min(u_xlat7.y, u_xlat7.x);
            u_xlat49 = min(u_xlat7.z, u_xlat49);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat49) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat6.xyz, u_xlat16_50);
        u_xlat16_11.x = u_xlat16_5.w + -1.0;
        u_xlat16_11.x = unity_SpecCube1_HDR.w * u_xlat16_11.x + 1.0;
        u_xlat16_11.x = log2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * unity_SpecCube1_HDR.y;
        u_xlat16_11.x = exp2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * unity_SpecCube1_HDR.x;
        u_xlat16_11.xyz = u_xlat16_5.xyz * u_xlat16_11.xxx;
        u_xlat4.xyz = vec3(u_xlat16_9) * u_xlat16_4.xyz + (-u_xlat16_11.xyz);
        u_xlat24.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_11.xyz;
        u_xlat16_24.xyz = u_xlat24.xyz;
    }
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_11.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xyz = vec3(u_xlat46) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_9 = (-u_xlat46) * 0.959999979 + 0.959999979;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(u_xlat16_9);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat45) + _WorldSpaceLightPos0.xyz;
    u_xlat45 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat45 = max(u_xlat45, 0.00100000005);
    u_xlat45 = inversesqrt(u_xlat45);
    u_xlat0.xyz = vec3(u_xlat45) * u_xlat0.xyz;
    u_xlat45 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat0.x + u_xlat0.x;
    u_xlat16_56 = u_xlat0.x * u_xlat16_56;
    u_xlat16_56 = u_xlat16_56 * u_xlat48 + -0.5;
    u_xlat16_57 = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_13;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + 1.0;
    u_xlat16_13 = -abs(u_xlat45) + 1.0;
    u_xlat16_28.x = u_xlat16_13 * u_xlat16_13;
    u_xlat16_28.x = u_xlat16_28.x * u_xlat16_28.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_28.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_13 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat15 = u_xlat1.x * u_xlat16_56;
    u_xlat30 = u_xlat48 * u_xlat48;
    u_xlat30 = max(u_xlat30, 0.00200000009);
    u_xlat31 = (-u_xlat30) + 1.0;
    u_xlat46 = abs(u_xlat45) * u_xlat31 + u_xlat30;
    u_xlat31 = u_xlat1.x * u_xlat31 + u_xlat30;
    u_xlat45 = abs(u_xlat45) * u_xlat31;
    u_xlat45 = u_xlat1.x * u_xlat46 + u_xlat45;
    u_xlat45 = u_xlat45 + 9.99999975e-06;
    u_xlat45 = 0.5 / u_xlat45;
    u_xlat31 = u_xlat30 * u_xlat30;
    u_xlat46 = u_xlat16 * u_xlat31 + (-u_xlat16);
    u_xlat16 = u_xlat46 * u_xlat16 + 1.0;
    u_xlat31 = u_xlat31 * 0.318309873;
    u_xlat16 = u_xlat16 * u_xlat16 + 1.00000001e-07;
    u_xlat16 = u_xlat31 / u_xlat16;
    u_xlat45 = u_xlat45 * u_xlat16;
    u_xlat45 = u_xlat1.x * u_xlat45;
    u_xlat45 = u_xlat45 * 3.14159274;
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat30 = u_xlat30 * u_xlat30 + 1.0;
    u_xlat30 = float(1.0) / u_xlat30;
    u_xlat16_56 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_56!=0.0);
#else
    u_xlatb1 = u_xlat16_56!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat45 = u_xlat45 * u_xlat1.x;
    u_xlat16_9 = (-u_xlat16_9) + 1.0;
    u_xlat16_9 = u_xlat16_47 * _SmoothnessAmount + u_xlat16_9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_28.xyz = vec3(u_xlat15) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat45) * _LightColor0.xyz;
    u_xlat16_56 = (-u_xlat0.x) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat16_14.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(u_xlat16_56) + u_xlat16_11.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_14.xyz;
    u_xlat0.xyw = u_xlat16_12.xyz * u_xlat16_28.xyz + u_xlat0.xyw;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(u_xlat30);
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + vec3(u_xlat16_9);
    u_xlat16_11.xyz = vec3(u_xlat16_13) * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_24.xyz * u_xlat16_11.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(_EmissiveAmount) + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 97521
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec2 _DiffuseTiling;
uniform 	vec2 _DiffuseOffset;
uniform 	vec2 _EmissiveTiling;
uniform 	vec2 _EmissiveOffset;
uniform 	float _EmissiveAmount;
uniform 	vec2 _MetallicTiling;
uniform 	vec2 _MetallicOffset;
uniform 	float _MetallicAmount;
uniform 	vec2 _SmoothnessTiling;
uniform 	vec2 _SmoothnessOffset;
uniform 	float _SmoothnessAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(2) uniform mediump sampler2D _Metallic;
UNITY_LOCATION(3) uniform mediump sampler2D _Smoothness;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_MetallicTiling.x, _MetallicTiling.y) + _MetallicOffset.xy;
    u_xlat16_0.x = texture(_Metallic, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _MetallicAmount;
    u_xlat16_1.x = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTiling.xy + vec2(_DiffuseOffset.x, _DiffuseOffset.y);
    u_xlat16_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = u_xlat0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target0.w = 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SmoothnessTiling.xy + vec2(_SmoothnessOffset.x, _SmoothnessOffset.y);
    u_xlat16_0.x = texture(_Smoothness, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _SmoothnessAmount;
    SV_Target1.w = u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _EmissiveTiling.xy + vec2(_EmissiveOffset.x, _EmissiveOffset.y);
    u_xlat16_0.xyz = texture(_Emissive, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_EmissiveAmount);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec2 _DiffuseTiling;
uniform 	vec2 _DiffuseOffset;
uniform 	vec2 _EmissiveTiling;
uniform 	vec2 _EmissiveOffset;
uniform 	float _EmissiveAmount;
uniform 	vec2 _MetallicTiling;
uniform 	vec2 _MetallicOffset;
uniform 	float _MetallicAmount;
uniform 	vec2 _SmoothnessTiling;
uniform 	vec2 _SmoothnessOffset;
uniform 	float _SmoothnessAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(2) uniform mediump sampler2D _Metallic;
UNITY_LOCATION(3) uniform mediump sampler2D _Smoothness;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_MetallicTiling.x, _MetallicTiling.y) + _MetallicOffset.xy;
    u_xlat16_0.x = texture(_Metallic, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _MetallicAmount;
    u_xlat16_1.x = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTiling.xy + vec2(_DiffuseOffset.x, _DiffuseOffset.y);
    u_xlat16_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = u_xlat0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target0.w = 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SmoothnessTiling.xy + vec2(_SmoothnessOffset.x, _SmoothnessOffset.y);
    u_xlat16_0.x = texture(_Smoothness, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _SmoothnessAmount;
    SV_Target1.w = u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _EmissiveTiling.xy + vec2(_EmissiveOffset.x, _EmissiveOffset.y);
    u_xlat16_0.xyz = texture(_Emissive, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_EmissiveAmount);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec2 _DiffuseTiling;
uniform 	vec2 _DiffuseOffset;
uniform 	vec2 _EmissiveTiling;
uniform 	vec2 _EmissiveOffset;
uniform 	float _EmissiveAmount;
uniform 	vec2 _MetallicTiling;
uniform 	vec2 _MetallicOffset;
uniform 	float _MetallicAmount;
uniform 	vec2 _SmoothnessTiling;
uniform 	vec2 _SmoothnessOffset;
uniform 	float _SmoothnessAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(2) uniform mediump sampler2D _Metallic;
UNITY_LOCATION(3) uniform mediump sampler2D _Smoothness;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_MetallicTiling.x, _MetallicTiling.y) + _MetallicOffset.xy;
    u_xlat16_0.x = texture(_Metallic, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _MetallicAmount;
    u_xlat16_1.x = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTiling.xy + vec2(_DiffuseOffset.x, _DiffuseOffset.y);
    u_xlat16_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = u_xlat0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target0.w = 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SmoothnessTiling.xy + vec2(_SmoothnessOffset.x, _SmoothnessOffset.y);
    u_xlat16_0.x = texture(_Smoothness, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _SmoothnessAmount;
    SV_Target1.w = u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _EmissiveTiling.xy + vec2(_EmissiveOffset.x, _EmissiveOffset.y);
    u_xlat16_0.xyz = texture(_Emissive, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_EmissiveAmount);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec2 _DiffuseTiling;
uniform 	vec2 _DiffuseOffset;
uniform 	vec2 _EmissiveTiling;
uniform 	vec2 _EmissiveOffset;
uniform 	float _EmissiveAmount;
uniform 	vec2 _MetallicTiling;
uniform 	vec2 _MetallicOffset;
uniform 	float _MetallicAmount;
uniform 	vec2 _SmoothnessTiling;
uniform 	vec2 _SmoothnessOffset;
uniform 	float _SmoothnessAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(2) uniform mediump sampler2D _Metallic;
UNITY_LOCATION(3) uniform mediump sampler2D _Smoothness;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_MetallicTiling.x, _MetallicTiling.y) + _MetallicOffset.xy;
    u_xlat16_0.x = texture(_Metallic, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _MetallicAmount;
    u_xlat16_1.x = (-u_xlat0.x) * 0.959999979 + 0.959999979;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTiling.xy + vec2(_DiffuseOffset.x, _DiffuseOffset.y);
    u_xlat16_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = u_xlat0.xxx * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target0.w = 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SmoothnessTiling.xy + vec2(_SmoothnessOffset.x, _SmoothnessOffset.y);
    u_xlat16_0.x = texture(_Smoothness, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * _SmoothnessAmount;
    SV_Target1.w = u_xlat0.x;
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _EmissiveTiling.xy + vec2(_EmissiveOffset.x, _EmissiveOffset.y);
    u_xlat16_0.xyz = texture(_Emissive, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_EmissiveAmount);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target3.w = 1.0;
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
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}