//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Avatar/Base" {
Properties {
_Color ("_Color", Color) = (1,1,1,1)
_MainTex ("_MainTex", 2D) = "white" { }
_MetallicGlossMap ("_MetallicGlossMap", 2D) = "black" { }
_BumpMap ("_BumpMap", 2D) = "bump" { }
}
SubShader {
 LOD 300
 Tags { "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 59933
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bvec3 u_xlatb14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
float u_xlat19;
float u_xlat36;
float u_xlat37;
float u_xlat54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat54 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16_3.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * _Color.xyz;
    u_xlat16_6.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat7.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat7.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat7.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat7.xyz;
    u_xlat55 = (-u_xlat16_6.y) + 1.0;
    u_xlat16_8.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat4.xyz * (-u_xlat16_8.xxx) + (-u_xlat2.xyz);
    u_xlat4.w = 1.0;
    u_xlat16_9.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_9.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_9.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb56 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb56){
        u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat56 = inversesqrt(u_xlat56);
        u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
        u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat7.xyz;
        u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat7.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat56 = min(u_xlat10.y, u_xlat10.x);
        u_xlat56 = min(u_xlat10.z, u_xlat56);
        u_xlat10.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat56) + u_xlat10.xyz;
    } else {
        u_xlat7.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_62 = (-u_xlat55) * 0.699999988 + 1.70000005;
    u_xlat16_62 = u_xlat55 * u_xlat16_62;
    u_xlat16_62 = u_xlat16_62 * 6.0;
    u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat16_62);
    u_xlat16_63 = u_xlat16_7.w + -1.0;
    u_xlat16_63 = unity_SpecCube0_HDR.w * u_xlat16_63 + 1.0;
    u_xlat16_63 = log2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.y;
    u_xlat16_63 = exp2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.x;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(u_xlat16_63);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb56 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb56){
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb56 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb56){
            u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat56 = inversesqrt(u_xlat56);
            u_xlat10.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
            u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat11;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat11.x : u_xlat12.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat11.y : u_xlat12.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat11.z : u_xlat12.z;
                u_xlat11 = hlslcc_movcTemp;
            }
            u_xlat56 = min(u_xlat11.y, u_xlat11.x);
            u_xlat56 = min(u_xlat11.z, u_xlat56);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat56) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_8 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_62);
        u_xlat16_67 = u_xlat16_8.w + -1.0;
        u_xlat16_67 = unity_SpecCube1_HDR.w * u_xlat16_67 + 1.0;
        u_xlat16_67 = log2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.y;
        u_xlat16_67 = exp2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.x;
        u_xlat16_15.xyz = u_xlat16_8.xyz * vec3(u_xlat16_67);
        u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz + (-u_xlat16_15.xyz);
        u_xlat13.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_15.xyz;
        u_xlat16_13.xyz = u_xlat13.xyz;
    }
    u_xlat16_15.xyz = _Color.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_6.x) * 0.959999979 + 0.959999979;
    u_xlat16_16.xyz = u_xlat5.xyz * vec3(u_xlat16_63);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat54) + _WorldSpaceLightPos0.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat0.x + u_xlat0.x;
    u_xlat16_67 = u_xlat0.x * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat55 + -0.5;
    u_xlat16_69 = (-u_xlat1.x) + 1.0;
    u_xlat16_70 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_69 + 1.0;
    u_xlat16_70 = -abs(u_xlat54) + 1.0;
    u_xlat16_17.x = u_xlat16_70 * u_xlat16_70;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat18 = u_xlat1.x * u_xlat16_67;
    u_xlat36 = u_xlat55 * u_xlat55;
    u_xlat36 = max(u_xlat36, 0.00200000009);
    u_xlat37 = (-u_xlat36) + 1.0;
    u_xlat55 = abs(u_xlat54) * u_xlat37 + u_xlat36;
    u_xlat37 = u_xlat1.x * u_xlat37 + u_xlat36;
    u_xlat54 = abs(u_xlat54) * u_xlat37;
    u_xlat54 = u_xlat1.x * u_xlat55 + u_xlat54;
    u_xlat54 = u_xlat54 + 9.99999975e-06;
    u_xlat54 = 0.5 / u_xlat54;
    u_xlat37 = u_xlat36 * u_xlat36;
    u_xlat55 = u_xlat19 * u_xlat37 + (-u_xlat19);
    u_xlat19 = u_xlat55 * u_xlat19 + 1.0;
    u_xlat37 = u_xlat37 * 0.318309873;
    u_xlat19 = u_xlat19 * u_xlat19 + 1.00000001e-07;
    u_xlat19 = u_xlat37 / u_xlat19;
    u_xlat54 = u_xlat54 * u_xlat19;
    u_xlat54 = u_xlat1.x * u_xlat54;
    u_xlat54 = u_xlat54 * 3.14159274;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat36 = u_xlat36 * u_xlat36 + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_67!=0.0);
#else
    u_xlatb1 = u_xlat16_67!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat54 = u_xlat54 * u_xlat1.x;
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat16_6.y + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = _LightColor0.xyz * vec3(u_xlat18) + u_xlat16_9.xyz;
    u_xlat1.xyz = vec3(u_xlat54) * _LightColor0.xyz;
    u_xlat16_67 = (-u_xlat0.x) + 1.0;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_67) + u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_17.xyz;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat16_9.xyz + u_xlat0.xyw;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat36);
    u_xlat16_13.xyz = (-u_xlat16_15.xyz) + vec3(u_xlat16_63);
    u_xlat16_13.xyz = vec3(u_xlat16_70) * u_xlat16_13.xyz + u_xlat16_15.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bvec3 u_xlatb14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
float u_xlat19;
float u_xlat36;
float u_xlat37;
float u_xlat54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat54 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16_3.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * _Color.xyz;
    u_xlat16_6.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat7.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat7.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat7.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat7.xyz;
    u_xlat55 = (-u_xlat16_6.y) + 1.0;
    u_xlat16_8.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat4.xyz * (-u_xlat16_8.xxx) + (-u_xlat2.xyz);
    u_xlat4.w = 1.0;
    u_xlat16_9.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_9.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_9.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb56 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb56){
        u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat56 = inversesqrt(u_xlat56);
        u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
        u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat7.xyz;
        u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat7.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat56 = min(u_xlat10.y, u_xlat10.x);
        u_xlat56 = min(u_xlat10.z, u_xlat56);
        u_xlat10.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat56) + u_xlat10.xyz;
    } else {
        u_xlat7.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_62 = (-u_xlat55) * 0.699999988 + 1.70000005;
    u_xlat16_62 = u_xlat55 * u_xlat16_62;
    u_xlat16_62 = u_xlat16_62 * 6.0;
    u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat16_62);
    u_xlat16_63 = u_xlat16_7.w + -1.0;
    u_xlat16_63 = unity_SpecCube0_HDR.w * u_xlat16_63 + 1.0;
    u_xlat16_63 = log2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.y;
    u_xlat16_63 = exp2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.x;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(u_xlat16_63);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb56 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb56){
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb56 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb56){
            u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat56 = inversesqrt(u_xlat56);
            u_xlat10.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
            u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat11;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat11.x : u_xlat12.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat11.y : u_xlat12.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat11.z : u_xlat12.z;
                u_xlat11 = hlslcc_movcTemp;
            }
            u_xlat56 = min(u_xlat11.y, u_xlat11.x);
            u_xlat56 = min(u_xlat11.z, u_xlat56);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat56) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_8 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_62);
        u_xlat16_67 = u_xlat16_8.w + -1.0;
        u_xlat16_67 = unity_SpecCube1_HDR.w * u_xlat16_67 + 1.0;
        u_xlat16_67 = log2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.y;
        u_xlat16_67 = exp2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.x;
        u_xlat16_15.xyz = u_xlat16_8.xyz * vec3(u_xlat16_67);
        u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz + (-u_xlat16_15.xyz);
        u_xlat13.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_15.xyz;
        u_xlat16_13.xyz = u_xlat13.xyz;
    }
    u_xlat16_15.xyz = _Color.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_6.x) * 0.959999979 + 0.959999979;
    u_xlat16_16.xyz = u_xlat5.xyz * vec3(u_xlat16_63);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat54) + _WorldSpaceLightPos0.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat0.x + u_xlat0.x;
    u_xlat16_67 = u_xlat0.x * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat55 + -0.5;
    u_xlat16_69 = (-u_xlat1.x) + 1.0;
    u_xlat16_70 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_69 + 1.0;
    u_xlat16_70 = -abs(u_xlat54) + 1.0;
    u_xlat16_17.x = u_xlat16_70 * u_xlat16_70;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat18 = u_xlat1.x * u_xlat16_67;
    u_xlat36 = u_xlat55 * u_xlat55;
    u_xlat36 = max(u_xlat36, 0.00200000009);
    u_xlat37 = (-u_xlat36) + 1.0;
    u_xlat55 = abs(u_xlat54) * u_xlat37 + u_xlat36;
    u_xlat37 = u_xlat1.x * u_xlat37 + u_xlat36;
    u_xlat54 = abs(u_xlat54) * u_xlat37;
    u_xlat54 = u_xlat1.x * u_xlat55 + u_xlat54;
    u_xlat54 = u_xlat54 + 9.99999975e-06;
    u_xlat54 = 0.5 / u_xlat54;
    u_xlat37 = u_xlat36 * u_xlat36;
    u_xlat55 = u_xlat19 * u_xlat37 + (-u_xlat19);
    u_xlat19 = u_xlat55 * u_xlat19 + 1.0;
    u_xlat37 = u_xlat37 * 0.318309873;
    u_xlat19 = u_xlat19 * u_xlat19 + 1.00000001e-07;
    u_xlat19 = u_xlat37 / u_xlat19;
    u_xlat54 = u_xlat54 * u_xlat19;
    u_xlat54 = u_xlat1.x * u_xlat54;
    u_xlat54 = u_xlat54 * 3.14159274;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat36 = u_xlat36 * u_xlat36 + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_67!=0.0);
#else
    u_xlatb1 = u_xlat16_67!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat54 = u_xlat54 * u_xlat1.x;
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat16_6.y + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = _LightColor0.xyz * vec3(u_xlat18) + u_xlat16_9.xyz;
    u_xlat1.xyz = vec3(u_xlat54) * _LightColor0.xyz;
    u_xlat16_67 = (-u_xlat0.x) + 1.0;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_67) + u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_17.xyz;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat16_9.xyz + u_xlat0.xyw;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat36);
    u_xlat16_13.xyz = (-u_xlat16_15.xyz) + vec3(u_xlat16_63);
    u_xlat16_13.xyz = vec3(u_xlat16_70) * u_xlat16_13.xyz + u_xlat16_15.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.wwzw + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bvec3 u_xlatb14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
float u_xlat19;
float u_xlat36;
float u_xlat37;
float u_xlat54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat54 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16_3.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * _Color.xyz;
    u_xlat16_6.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat7.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat7.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat7.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat7.xyz;
    u_xlat55 = (-u_xlat16_6.y) + 1.0;
    u_xlat16_8.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat4.xyz * (-u_xlat16_8.xxx) + (-u_xlat2.xyz);
    u_xlat4.w = 1.0;
    u_xlat16_9.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_9.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_9.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb56 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb56){
        u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat56 = inversesqrt(u_xlat56);
        u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
        u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat7.xyz;
        u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat7.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat56 = min(u_xlat10.y, u_xlat10.x);
        u_xlat56 = min(u_xlat10.z, u_xlat56);
        u_xlat10.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat56) + u_xlat10.xyz;
    } else {
        u_xlat7.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_62 = (-u_xlat55) * 0.699999988 + 1.70000005;
    u_xlat16_62 = u_xlat55 * u_xlat16_62;
    u_xlat16_62 = u_xlat16_62 * 6.0;
    u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat16_62);
    u_xlat16_63 = u_xlat16_7.w + -1.0;
    u_xlat16_63 = unity_SpecCube0_HDR.w * u_xlat16_63 + 1.0;
    u_xlat16_63 = log2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.y;
    u_xlat16_63 = exp2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.x;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(u_xlat16_63);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb56 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb56){
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb56 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb56){
            u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat56 = inversesqrt(u_xlat56);
            u_xlat10.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
            u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat11;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat11.x : u_xlat12.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat11.y : u_xlat12.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat11.z : u_xlat12.z;
                u_xlat11 = hlslcc_movcTemp;
            }
            u_xlat56 = min(u_xlat11.y, u_xlat11.x);
            u_xlat56 = min(u_xlat11.z, u_xlat56);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat56) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_8 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_62);
        u_xlat16_67 = u_xlat16_8.w + -1.0;
        u_xlat16_67 = unity_SpecCube1_HDR.w * u_xlat16_67 + 1.0;
        u_xlat16_67 = log2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.y;
        u_xlat16_67 = exp2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.x;
        u_xlat16_15.xyz = u_xlat16_8.xyz * vec3(u_xlat16_67);
        u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz + (-u_xlat16_15.xyz);
        u_xlat13.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_15.xyz;
        u_xlat16_13.xyz = u_xlat13.xyz;
    }
    u_xlat16_15.xyz = _Color.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_6.x) * 0.959999979 + 0.959999979;
    u_xlat16_16.xyz = u_xlat5.xyz * vec3(u_xlat16_63);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat54) + _WorldSpaceLightPos0.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat0.x + u_xlat0.x;
    u_xlat16_67 = u_xlat0.x * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat55 + -0.5;
    u_xlat16_69 = (-u_xlat1.x) + 1.0;
    u_xlat16_70 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_69 + 1.0;
    u_xlat16_70 = -abs(u_xlat54) + 1.0;
    u_xlat16_17.x = u_xlat16_70 * u_xlat16_70;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat18 = u_xlat1.x * u_xlat16_67;
    u_xlat36 = u_xlat55 * u_xlat55;
    u_xlat36 = max(u_xlat36, 0.00200000009);
    u_xlat37 = (-u_xlat36) + 1.0;
    u_xlat55 = abs(u_xlat54) * u_xlat37 + u_xlat36;
    u_xlat37 = u_xlat1.x * u_xlat37 + u_xlat36;
    u_xlat54 = abs(u_xlat54) * u_xlat37;
    u_xlat54 = u_xlat1.x * u_xlat55 + u_xlat54;
    u_xlat54 = u_xlat54 + 9.99999975e-06;
    u_xlat54 = 0.5 / u_xlat54;
    u_xlat37 = u_xlat36 * u_xlat36;
    u_xlat55 = u_xlat19 * u_xlat37 + (-u_xlat19);
    u_xlat19 = u_xlat55 * u_xlat19 + 1.0;
    u_xlat37 = u_xlat37 * 0.318309873;
    u_xlat19 = u_xlat19 * u_xlat19 + 1.00000001e-07;
    u_xlat19 = u_xlat37 / u_xlat19;
    u_xlat54 = u_xlat54 * u_xlat19;
    u_xlat54 = u_xlat1.x * u_xlat54;
    u_xlat54 = u_xlat54 * 3.14159274;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat36 = u_xlat36 * u_xlat36 + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_67!=0.0);
#else
    u_xlatb1 = u_xlat16_67!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat54 = u_xlat54 * u_xlat1.x;
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat16_6.y + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = _LightColor0.xyz * vec3(u_xlat18) + u_xlat16_9.xyz;
    u_xlat1.xyz = vec3(u_xlat54) * _LightColor0.xyz;
    u_xlat16_67 = (-u_xlat0.x) + 1.0;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_67) + u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_17.xyz;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat16_9.xyz + u_xlat0.xyw;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat36);
    u_xlat16_13.xyz = (-u_xlat16_15.xyz) + vec3(u_xlat16_63);
    u_xlat16_13.xyz = vec3(u_xlat16_70) * u_xlat16_13.xyz + u_xlat16_15.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.wwzw + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bvec3 u_xlatb12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bvec3 u_xlatb14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
float u_xlat18;
float u_xlat19;
float u_xlat36;
float u_xlat37;
float u_xlat54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat54 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16_3.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat16_3.xyz * _Color.xyz;
    u_xlat16_6.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat7.x = dot(vs_TEXCOORD1.xyz, u_xlat16_4.xyz);
    u_xlat7.y = dot(vs_TEXCOORD2.xyz, u_xlat16_4.xyz);
    u_xlat7.z = dot(vs_TEXCOORD3.xyz, u_xlat16_4.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat7.xyz;
    u_xlat55 = (-u_xlat16_6.y) + 1.0;
    u_xlat16_8.x = dot((-u_xlat2.xyz), u_xlat4.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = u_xlat4.xyz * (-u_xlat16_8.xxx) + (-u_xlat2.xyz);
    u_xlat4.w = 1.0;
    u_xlat16_9.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_9.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_9.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb56 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb56){
        u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat56 = inversesqrt(u_xlat56);
        u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
        u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat7.xyz;
        u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat7.xyz;
        u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat56 = min(u_xlat10.y, u_xlat10.x);
        u_xlat56 = min(u_xlat10.z, u_xlat56);
        u_xlat10.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat56) + u_xlat10.xyz;
    } else {
        u_xlat7.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_62 = (-u_xlat55) * 0.699999988 + 1.70000005;
    u_xlat16_62 = u_xlat55 * u_xlat16_62;
    u_xlat16_62 = u_xlat16_62 * 6.0;
    u_xlat16_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat16_62);
    u_xlat16_63 = u_xlat16_7.w + -1.0;
    u_xlat16_63 = unity_SpecCube0_HDR.w * u_xlat16_63 + 1.0;
    u_xlat16_63 = log2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.y;
    u_xlat16_63 = exp2(u_xlat16_63);
    u_xlat16_63 = u_xlat16_63 * unity_SpecCube0_HDR.x;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(u_xlat16_63);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb56 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb56){
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb56 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb56){
            u_xlat56 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat56 = inversesqrt(u_xlat56);
            u_xlat10.xyz = vec3(u_xlat56) * u_xlat16_8.xyz;
            u_xlat11.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat11;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat11.x : u_xlat12.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat11.y : u_xlat12.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat11.z : u_xlat12.z;
                u_xlat11 = hlslcc_movcTemp;
            }
            u_xlat56 = min(u_xlat11.y, u_xlat11.x);
            u_xlat56 = min(u_xlat11.z, u_xlat56);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat10.xyz * vec3(u_xlat56) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_8 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_62);
        u_xlat16_67 = u_xlat16_8.w + -1.0;
        u_xlat16_67 = unity_SpecCube1_HDR.w * u_xlat16_67 + 1.0;
        u_xlat16_67 = log2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.y;
        u_xlat16_67 = exp2(u_xlat16_67);
        u_xlat16_67 = u_xlat16_67 * unity_SpecCube1_HDR.x;
        u_xlat16_15.xyz = u_xlat16_8.xyz * vec3(u_xlat16_67);
        u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz + (-u_xlat16_15.xyz);
        u_xlat13.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_15.xyz;
        u_xlat16_13.xyz = u_xlat13.xyz;
    }
    u_xlat16_15.xyz = _Color.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_15.xyz = u_xlat16_6.xxx * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = (-u_xlat16_6.x) * 0.959999979 + 0.959999979;
    u_xlat16_16.xyz = u_xlat5.xyz * vec3(u_xlat16_63);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat54) + _WorldSpaceLightPos0.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat4.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat0.x + u_xlat0.x;
    u_xlat16_67 = u_xlat0.x * u_xlat16_67;
    u_xlat16_67 = u_xlat16_67 * u_xlat55 + -0.5;
    u_xlat16_69 = (-u_xlat1.x) + 1.0;
    u_xlat16_70 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_69 + 1.0;
    u_xlat16_70 = -abs(u_xlat54) + 1.0;
    u_xlat16_17.x = u_xlat16_70 * u_xlat16_70;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_17.x;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_70 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat18 = u_xlat1.x * u_xlat16_67;
    u_xlat36 = u_xlat55 * u_xlat55;
    u_xlat36 = max(u_xlat36, 0.00200000009);
    u_xlat37 = (-u_xlat36) + 1.0;
    u_xlat55 = abs(u_xlat54) * u_xlat37 + u_xlat36;
    u_xlat37 = u_xlat1.x * u_xlat37 + u_xlat36;
    u_xlat54 = abs(u_xlat54) * u_xlat37;
    u_xlat54 = u_xlat1.x * u_xlat55 + u_xlat54;
    u_xlat54 = u_xlat54 + 9.99999975e-06;
    u_xlat54 = 0.5 / u_xlat54;
    u_xlat37 = u_xlat36 * u_xlat36;
    u_xlat55 = u_xlat19 * u_xlat37 + (-u_xlat19);
    u_xlat19 = u_xlat55 * u_xlat19 + 1.0;
    u_xlat37 = u_xlat37 * 0.318309873;
    u_xlat19 = u_xlat19 * u_xlat19 + 1.00000001e-07;
    u_xlat19 = u_xlat37 / u_xlat19;
    u_xlat54 = u_xlat54 * u_xlat19;
    u_xlat54 = u_xlat1.x * u_xlat54;
    u_xlat54 = u_xlat54 * 3.14159274;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat36 = u_xlat36 * u_xlat36 + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_67!=0.0);
#else
    u_xlatb1 = u_xlat16_67!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat54 = u_xlat54 * u_xlat1.x;
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat16_6.y + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = _LightColor0.xyz * vec3(u_xlat18) + u_xlat16_9.xyz;
    u_xlat1.xyz = vec3(u_xlat54) * _LightColor0.xyz;
    u_xlat16_67 = (-u_xlat0.x) + 1.0;
    u_xlat16_69 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_69;
    u_xlat16_17.xyz = (-u_xlat16_15.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(u_xlat16_67) + u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_17.xyz;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat16_9.xyz + u_xlat0.xyw;
    u_xlat16_9.xyz = u_xlat16_13.xyz * vec3(u_xlat36);
    u_xlat16_13.xyz = (-u_xlat16_15.xyz) + vec3(u_xlat16_63);
    u_xlat16_13.xyz = vec3(u_xlat16_70) * u_xlat16_13.xyz + u_xlat16_15.xyz;
    u_xlat0.xyz = u_xlat16_9.xyz * u_xlat16_13.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
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
  Name "FORWARD"
  LOD 300
  Tags { "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 99925
Program "vp" {
SubProgram "gles3 " {
Keywords { "POINT" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec2 u_xlat16_10;
float u_xlat16;
mediump float u_xlat16_17;
float u_xlat18;
float u_xlat24;
mediump float u_xlat16_25;
float u_xlat26;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat10.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_10.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat16 = (-u_xlat16_10.y) + 1.0;
    u_xlat18 = u_xlat16 * u_xlat16;
    u_xlat18 = max(u_xlat18, 0.00200000009);
    u_xlat26 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat24 * u_xlat26 + (-u_xlat24);
    u_xlat24 = u_xlat3.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24 + 1.00000001e-07;
    u_xlat26 = u_xlat26 * 0.318309873;
    u_xlat24 = u_xlat26 / u_xlat24;
    u_xlat26 = (-u_xlat18) + 1.0;
    u_xlat3.x = abs(u_xlat2.x) * u_xlat26 + u_xlat18;
    u_xlat18 = u_xlat0.x * u_xlat26 + u_xlat18;
    u_xlat18 = u_xlat18 * abs(u_xlat2.x);
    u_xlat16_1.x = -abs(u_xlat2.x) + 1.0;
    u_xlat2.x = u_xlat0.x * u_xlat3.x + u_xlat18;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 0.5 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat16_2.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * u_xlat16_2.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xzw = u_xlat16_2.xzw * _Color.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xxx * u_xlat16_9.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.x = (-u_xlat16_10.x) * 0.959999979 + 0.959999979;
    u_xlat16_5.xyz = u_xlat2.xzw * u_xlat16_5.xxx;
    u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_29!=0.0);
#else
    u_xlatb2 = u_xlat16_29!=0.0;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = texture(_LightTexture0, u_xlat2.xx).x;
    u_xlat16_6.xyz = u_xlat2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz;
    u_xlat16_29 = (-u_xlat8) + 1.0;
    u_xlat16_30 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_30;
    u_xlat16_7.xyz = (-u_xlat16_9.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_9.xyz;
    u_xlat2.xyz = u_xlat16_9.xyz * u_xlat2.xyz;
    u_xlat16_9.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat8 + u_xlat8;
    u_xlat16_9.x = u_xlat8 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16 + -0.5;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x + 1.0;
    u_xlat16_17 = (-u_xlat0.x) + 1.0;
    u_xlat16_25 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_25;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat20 = dot(u_xlat0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat12 = (-u_xlat16_2.y) + 1.0;
    u_xlat8.x = u_xlat12 * u_xlat12;
    u_xlat8.x = max(u_xlat8.x, 0.00200000009);
    u_xlat14 = u_xlat8.x * u_xlat8.x;
    u_xlat3.x = u_xlat20 * u_xlat14 + (-u_xlat20);
    u_xlat20 = u_xlat3.x * u_xlat20 + 1.0;
    u_xlat20 = u_xlat20 * u_xlat20 + 1.00000001e-07;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat14 = u_xlat14 / u_xlat20;
    u_xlat20 = (-u_xlat8.x) + 1.0;
    u_xlat3.x = abs(u_xlat18) * u_xlat20 + u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat20 + u_xlat8.x;
    u_xlat8.x = abs(u_xlat18) * u_xlat8.x;
    u_xlat16_1.x = -abs(u_xlat18) + 1.0;
    u_xlat18 = u_xlat0.x * u_xlat3.x + u_xlat8.x;
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat18 = u_xlat14 * u_xlat18;
    u_xlat18 = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_8.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_7.xyz = _Color.xyz * u_xlat16_8.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat16_8.xyz * _Color.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = (-u_xlat16_2.x) * 0.959999979 + 0.959999979;
    u_xlat16_4.xyz = u_xlat8.xyz * u_xlat16_4.xxx;
    u_xlat16_22 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_22!=0.0);
#else
    u_xlatb2 = u_xlat16_22!=0.0;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat18) * _LightColor0.xyz;
    u_xlat16_22 = (-u_xlat6) + 1.0;
    u_xlat16_5.x = u_xlat16_22 * u_xlat16_22;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_5.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22) + u_xlat16_7.xyz;
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat2.xyz;
    u_xlat16_7.x = u_xlat6 + u_xlat6;
    u_xlat16_7.x = u_xlat6 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat12 + -0.5;
    u_xlat16_13 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13;
    u_xlat16_1.x = u_xlat16_7.x * u_xlat16_1.x + 1.0;
    u_xlat16_13 = (-u_xlat0.x) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_13 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(4) uniform highp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump float u_xlat16_11;
float u_xlat16;
float u_xlat17;
mediump float u_xlat16_19;
float u_xlat24;
float u_xlat25;
mediump float u_xlat16_26;
mediump float u_xlat16_27;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = vs_TEXCOORD4.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat24 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = u_xlat24 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
    u_xlat16_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat24) + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat5.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat9.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_9.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat16 = (-u_xlat16_9.y) + 1.0;
    u_xlat17 = u_xlat16 * u_xlat16;
    u_xlat17 = max(u_xlat17, 0.00200000009);
    u_xlat25 = u_xlat17 * u_xlat17;
    u_xlat4.x = u_xlat24 * u_xlat25 + (-u_xlat24);
    u_xlat24 = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24 + 1.00000001e-07;
    u_xlat25 = u_xlat25 * 0.318309873;
    u_xlat24 = u_xlat25 / u_xlat24;
    u_xlat25 = (-u_xlat17) + 1.0;
    u_xlat4.x = abs(u_xlat1.x) * u_xlat25 + u_xlat17;
    u_xlat17 = u_xlat0.x * u_xlat25 + u_xlat17;
    u_xlat17 = u_xlat17 * abs(u_xlat1.x);
    u_xlat16_26 = -abs(u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat0.x * u_xlat4.x + u_xlat17;
    u_xlat1.x = u_xlat1.x + 9.99999975e-06;
    u_xlat1.x = 0.5 / u_xlat1.x;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat16_1.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = _Color.xyz * u_xlat16_1.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat1.xzw = u_xlat16_1.xzw * _Color.xyz;
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_27 = (-u_xlat16_9.x) * 0.959999979 + 0.959999979;
    u_xlat16_6.xyz = u_xlat1.xzw * vec3(u_xlat16_27);
    u_xlat16_27 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_27!=0.0);
#else
    u_xlatb1 = u_xlat16_27!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(u_xlat24);
    u_xlat16_27 = (-u_xlat8) + 1.0;
    u_xlat16_30 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_30;
    u_xlat16_7.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(u_xlat16_27) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat16_26 * u_xlat16_26;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat8 + u_xlat8;
    u_xlat16_3.x = u_xlat8 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16 + -0.5;
    u_xlat16_26 = u_xlat16_3.x * u_xlat16_26 + 1.0;
    u_xlat16_11 = (-u_xlat0.x) + 1.0;
    u_xlat16_19 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_19;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_11 + 1.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_26;
    u_xlat16_2.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat13 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(4) uniform highp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec2 u_xlat16_11;
float u_xlat16;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
float u_xlat27;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD4.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz).w;
    u_xlat8 = texture(_LightTextureB0, vec2(u_xlat24)).x;
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat16_1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat16_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_2.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat24) + u_xlat3.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat11.xyz = vec3(u_xlat24) * u_xlat4.xyz;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat5.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_11.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat16 = (-u_xlat16_11.y) + 1.0;
    u_xlat19 = u_xlat16 * u_xlat16;
    u_xlat19 = max(u_xlat19, 0.00200000009);
    u_xlat27 = u_xlat19 * u_xlat19;
    u_xlat4.x = u_xlat24 * u_xlat27 + (-u_xlat24);
    u_xlat24 = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24 + 1.00000001e-07;
    u_xlat27 = u_xlat27 * 0.318309873;
    u_xlat24 = u_xlat27 / u_xlat24;
    u_xlat27 = (-u_xlat19) + 1.0;
    u_xlat4.x = abs(u_xlat3.x) * u_xlat27 + u_xlat19;
    u_xlat19 = u_xlat0.x * u_xlat27 + u_xlat19;
    u_xlat19 = u_xlat19 * abs(u_xlat3.x);
    u_xlat16_25 = -abs(u_xlat3.x) + 1.0;
    u_xlat3.x = u_xlat0.x * u_xlat4.x + u_xlat19;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 0.5 / u_xlat3.x;
    u_xlat24 = u_xlat24 * u_xlat3.x;
    u_xlat24 = u_xlat0.x * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat16_3.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = _Color.xyz * u_xlat16_3.xzw + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat3.xzw = u_xlat16_3.xzw * _Color.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xxx * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_26 = (-u_xlat16_11.x) * 0.959999979 + 0.959999979;
    u_xlat16_6.xyz = vec3(u_xlat16_26) * u_xlat3.xzw;
    u_xlat16_26 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_26!=0.0);
#else
    u_xlatb3 = u_xlat16_26!=0.0;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat3.x;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(u_xlat24);
    u_xlat16_26 = (-u_xlat8) + 1.0;
    u_xlat16_30 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_30;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(u_xlat16_26) + u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat16_2.x = u_xlat16_25 * u_xlat16_25;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat8 + u_xlat8;
    u_xlat16_2.x = u_xlat8 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16 + -0.5;
    u_xlat16_25 = u_xlat16_2.x * u_xlat16_25 + 1.0;
    u_xlat16_10 = (-u_xlat0.x) + 1.0;
    u_xlat16_18 = u_xlat16_10 * u_xlat16_10;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_18;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_10 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_25;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * u_xlat16_1.xyz + u_xlat3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BumpMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MetallicGlossMap;
UNITY_LOCATION(3) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat14;
mediump float u_xlat16_15;
float u_xlat16;
float u_xlat21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = texture(_BumpMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat0.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat0.z = dot(vs_TEXCOORD3.xyz, u_xlat16_1.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21) + _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.00100000005);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat23 = dot(u_xlat0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_2.xy = texture(_MetallicGlossMap, vs_TEXCOORD0.xy).xw;
    u_xlat14 = (-u_xlat16_2.y) + 1.0;
    u_xlat9.x = u_xlat14 * u_xlat14;
    u_xlat9.x = max(u_xlat9.x, 0.00200000009);
    u_xlat16 = u_xlat9.x * u_xlat9.x;
    u_xlat3.x = u_xlat23 * u_xlat16 + (-u_xlat23);
    u_xlat23 = u_xlat3.x * u_xlat23 + 1.0;
    u_xlat23 = u_xlat23 * u_xlat23 + 1.00000001e-07;
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat16 = u_xlat16 / u_xlat23;
    u_xlat23 = (-u_xlat9.x) + 1.0;
    u_xlat3.x = abs(u_xlat21) * u_xlat23 + u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat23 + u_xlat9.x;
    u_xlat9.x = abs(u_xlat21) * u_xlat9.x;
    u_xlat16_1.x = -abs(u_xlat21) + 1.0;
    u_xlat21 = u_xlat0.x * u_xlat3.x + u_xlat9.x;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat21 = u_xlat16 * u_xlat21;
    u_xlat21 = u_xlat0.x * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_9.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8.xyz = _Color.xyz * u_xlat16_9.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat16_9.xyz * _Color.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = (-u_xlat16_2.x) * 0.959999979 + 0.959999979;
    u_xlat16_4.xyz = u_xlat9.xyz * u_xlat16_4.xxx;
    u_xlat16_25 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_25!=0.0);
#else
    u_xlatb2 = u_xlat16_25!=0.0;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat2.x;
    u_xlat2.xy = vs_TEXCOORD4.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat2.x = texture(_LightTexture0, u_xlat2.xy).w;
    u_xlat16_5.xyz = u_xlat2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat16_25 = (-u_xlat7) + 1.0;
    u_xlat16_26 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_6.xyz = (-u_xlat16_8.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_25) + u_xlat16_8.xyz;
    u_xlat2.xyz = u_xlat16_8.xyz * u_xlat2.xyz;
    u_xlat16_8.x = u_xlat7 + u_xlat7;
    u_xlat16_8.x = u_xlat7 * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat14 + -0.5;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_15;
    u_xlat16_1.x = u_xlat16_8.x * u_xlat16_1.x + 1.0;
    u_xlat16_15 = (-u_xlat0.x) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_22;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_15 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
}
}
}