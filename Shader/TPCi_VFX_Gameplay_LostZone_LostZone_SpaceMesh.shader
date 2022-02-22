//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/LostZone/LostZone_SpaceMesh" {
Properties {
_Color ("Color", Color) = (0.03626502,1,0,0)
_Color_Center ("Color_Center", Color) = (0,0,0,0)
_MinimizeClouds ("Minimize Clouds", 2D) = "white" { }
_Clouds1Tiling ("Clouds 1 Tiling", Vector) = (3,0.15,0,0)
_Clouds2tiling ("Clouds 2 tiling", Vector) = (1,0.1,0,0)
_Clouds1PanningSpeed ("Clouds 1 Panning Speed", Vector) = (0.25,1,0,0)
_Clouds2PanningSpeed ("Clouds 2 Panning Speed", Vector) = (0.25,1,0,0)
_RadialGradientSmoothstepMin ("Radial Gradient Smoothstep Min", Float) = 0
_RadialGradientSmoothstepMax ("Radial Gradient Smoothstep Max", Range(0, 4)) = 1
_CoreSmoothStepMin ("Core SmoothStep Min", Float) = 0
_CoreSmoothStepMax ("Core SmoothStep Max", Float) = 0.3
_T_VFX_noise_dots ("T_VFX_noise_dots", 2D) = "white" { }
_StarsColor ("Stars Color", Color) = (0,0.8125157,1,0)
_CloudsSmoothstepMin ("Clouds Smoothstep Min", Float) = 0.39
_HighlightColor ("Highlight Color", Color) = (0,0,0,0)
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 25141
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
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
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
uniform 	vec4 _HighlightColor;
uniform 	float _CloudsSmoothstepMin;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat15;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat28;
float u_xlat36;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
float u_xlat39;
bool u_xlatb40;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat2.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_T_VFX_noise_dots, u_xlat2.xy).xyz;
    u_xlat37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat2.x;
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = dot(u_xlat26.xy, u_xlat26.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat15.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat4.xy = u_xlat3.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat15.xy = vec2(1.0, 1.0) / u_xlat15.xy;
    u_xlat15.xy = u_xlat15.xy * u_xlat4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat15.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat15.xy = u_xlat15.xy * u_xlat15.xy;
    u_xlat15.x = (-u_xlat4.x) * u_xlat15.x + 1.0;
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat39 = min(abs(u_xlat26.y), abs(u_xlat26.x));
    u_xlat4.x = max(abs(u_xlat26.y), abs(u_xlat26.x));
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat39 = u_xlat39 * u_xlat4.x;
    u_xlat4.x = u_xlat39 * u_xlat39;
    u_xlat28 = u_xlat4.x * 0.0208350997 + -0.0851330012;
    u_xlat28 = u_xlat4.x * u_xlat28 + 0.180141002;
    u_xlat28 = u_xlat4.x * u_xlat28 + -0.330299497;
    u_xlat4.x = u_xlat4.x * u_xlat28 + 0.999866009;
    u_xlat28 = u_xlat39 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(abs(u_xlat26.y)<abs(u_xlat26.x));
#else
    u_xlatb40 = abs(u_xlat26.y)<abs(u_xlat26.x);
#endif
    u_xlat28 = u_xlat28 * -2.0 + 1.57079637;
    u_xlat28 = u_xlatb40 ? u_xlat28 : float(0.0);
    u_xlat39 = u_xlat39 * u_xlat4.x + u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat26.y<(-u_xlat26.y));
#else
    u_xlatb4 = u_xlat26.y<(-u_xlat26.y);
#endif
    u_xlat4.x = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat39 = u_xlat39 + u_xlat4.x;
    u_xlat4.x = min(u_xlat26.y, u_xlat26.x);
    u_xlat26.x = max(u_xlat26.y, u_xlat26.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(u_xlat4.x<(-u_xlat4.x));
#else
    u_xlatb38 = u_xlat4.x<(-u_xlat4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat26.x>=(-u_xlat26.x));
#else
    u_xlatb26 = u_xlat26.x>=(-u_xlat26.x);
#endif
    u_xlatb26 = u_xlatb26 && u_xlatb38;
    u_xlat26.x = (u_xlatb26) ? (-u_xlat39) : u_xlat39;
    u_xlat26.x = u_xlat26.x * 0.159154937;
    u_xlat26.x = fract(u_xlat26.x);
    u_xlat5.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat26.x;
    u_xlat5.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat3.x;
    u_xlat16_4.xz = texture(_Sampler607, u_xlat2.xy).xy;
    u_xlat4.xz = _Clouds1Tiling.xy * u_xlat5.xy + u_xlat16_4.xz;
    u_xlat16_4.xzw = texture(_MinimizeClouds, u_xlat4.xz).xyz;
    u_xlat38 = (-u_xlat4.y) * u_xlat15.y + u_xlat15.x;
    u_xlat38 = u_xlat38 + 1.0;
    u_xlat5.xyz = u_xlat16_4.xzw + vec3(u_xlat38);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat5.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat7.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat26.x;
    u_xlat7.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat3.x;
    u_xlat3.xzw = (-u_xlat6.xyz) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xy = texture(_Sampler6050, u_xlat2.xy).xy;
    u_xlat2.xy = _Clouds2tiling.xy * u_xlat7.xy + u_xlat16_2.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + u_xlat16_4.xzw;
    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat15.xxx;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xzw;
    u_xlat3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = _StarsColor.xyz * vec3(u_xlat37) + _Color_Center.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat37 = (-_CloudsSmoothstepMin) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz + (-vec3(_CloudsSmoothstepMin));
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat2.xyz = vec3(u_xlat37) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = _HighlightColor.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat37 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat37 = (-u_xlat37) + 1.0;
    u_xlat38 = u_xlat37 * u_xlat37;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat37 = (-u_xlat37) * u_xlat38 + 1.0;
    u_xlat37 = u_xlat37 * vs_COLOR0.x;
    u_xlat16_8.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_8.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb38 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb38){
        u_xlat38 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat38 = inversesqrt(u_xlat38);
        u_xlat4.xyz = vec3(u_xlat38) * u_xlat16_8.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat38 = min(u_xlat5.y, u_xlat5.x);
        u_xlat38 = min(u_xlat5.z, u_xlat38);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat38) + u_xlat5.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, 6.0);
    u_xlat16_44 = u_xlat16_4.w + -1.0;
    u_xlat16_44 = unity_SpecCube0_HDR.w * u_xlat16_44 + 1.0;
    u_xlat16_44 = log2(u_xlat16_44);
    u_xlat16_44 = u_xlat16_44 * unity_SpecCube0_HDR.y;
    u_xlat16_44 = exp2(u_xlat16_44);
    u_xlat16_44 = u_xlat16_44 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(u_xlat16_44);
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb38){
#ifdef UNITY_ADRENO_ES3
        u_xlatb38 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb38){
            u_xlat38 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat38 = inversesqrt(u_xlat38);
            u_xlat5.xyz = vec3(u_xlat38) * u_xlat16_8.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat38 = min(u_xlat6.y, u_xlat6.x);
            u_xlat38 = min(u_xlat6.z, u_xlat38);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat38) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_8.x = u_xlat16_5.w + -1.0;
        u_xlat16_8.x = unity_SpecCube1_HDR.w * u_xlat16_8.x + 1.0;
        u_xlat16_8.x = log2(u_xlat16_8.x);
        u_xlat16_8.x = u_xlat16_8.x * unity_SpecCube1_HDR.y;
        u_xlat16_8.x = exp2(u_xlat16_8.x);
        u_xlat16_8.x = u_xlat16_8.x * unity_SpecCube1_HDR.x;
        u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_8.xxx;
        u_xlat4.xyz = vec3(u_xlat16_44) * u_xlat16_4.xyz + (-u_xlat16_8.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat38 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat38) * vs_TEXCOORD1.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_44 = u_xlat0.x + u_xlat0.x;
    u_xlat16_44 = u_xlat16_44 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_44 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_11 + 1.0;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_44;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_44 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_44 * u_xlat16_44;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_44 = u_xlat16_44 * u_xlat16_45;
    u_xlat16_44 = u_xlat16_44 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_44);
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_44 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(u_xlat16_44) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat37;
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
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
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
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
uniform 	vec4 _HighlightColor;
uniform 	float _CloudsSmoothstepMin;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bvec3 u_xlatb11;
mediump float u_xlat16_12;
vec3 u_xlat13;
vec2 u_xlat16;
float u_xlat26;
vec2 u_xlat28;
bool u_xlatb28;
float u_xlat30;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb43;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat2.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_T_VFX_noise_dots, u_xlat2.xy).xyz;
    u_xlat40 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat28.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat16.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat4.xy = u_xlat3.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat16.xy = vec2(1.0, 1.0) / u_xlat16.xy;
    u_xlat16.xy = u_xlat16.xy * u_xlat4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat16.xy = u_xlat16.xy * u_xlat16.xy;
    u_xlat16.x = (-u_xlat4.x) * u_xlat16.x + 1.0;
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = min(abs(u_xlat28.y), abs(u_xlat28.x));
    u_xlat4.x = max(abs(u_xlat28.y), abs(u_xlat28.x));
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat42 = u_xlat42 * u_xlat4.x;
    u_xlat4.x = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat4.x * 0.0208350997 + -0.0851330012;
    u_xlat30 = u_xlat4.x * u_xlat30 + 0.180141002;
    u_xlat30 = u_xlat4.x * u_xlat30 + -0.330299497;
    u_xlat4.x = u_xlat4.x * u_xlat30 + 0.999866009;
    u_xlat30 = u_xlat42 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(abs(u_xlat28.y)<abs(u_xlat28.x));
#else
    u_xlatb43 = abs(u_xlat28.y)<abs(u_xlat28.x);
#endif
    u_xlat30 = u_xlat30 * -2.0 + 1.57079637;
    u_xlat30 = u_xlatb43 ? u_xlat30 : float(0.0);
    u_xlat42 = u_xlat42 * u_xlat4.x + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat28.y<(-u_xlat28.y));
#else
    u_xlatb4 = u_xlat28.y<(-u_xlat28.y);
#endif
    u_xlat4.x = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat42 = u_xlat42 + u_xlat4.x;
    u_xlat4.x = min(u_xlat28.y, u_xlat28.x);
    u_xlat28.x = max(u_xlat28.y, u_xlat28.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(u_xlat4.x<(-u_xlat4.x));
#else
    u_xlatb41 = u_xlat4.x<(-u_xlat4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat28.x>=(-u_xlat28.x));
#else
    u_xlatb28 = u_xlat28.x>=(-u_xlat28.x);
#endif
    u_xlatb28 = u_xlatb28 && u_xlatb41;
    u_xlat28.x = (u_xlatb28) ? (-u_xlat42) : u_xlat42;
    u_xlat28.x = u_xlat28.x * 0.159154937;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat5.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat28.x;
    u_xlat5.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat3.x;
    u_xlat16_4.xz = texture(_Sampler607, u_xlat2.xy).xy;
    u_xlat4.xz = _Clouds1Tiling.xy * u_xlat5.xy + u_xlat16_4.xz;
    u_xlat16_4.xzw = texture(_MinimizeClouds, u_xlat4.xz).xyz;
    u_xlat41 = (-u_xlat4.y) * u_xlat16.y + u_xlat16.x;
    u_xlat41 = u_xlat41 + 1.0;
    u_xlat5.xyz = u_xlat16_4.xzw + vec3(u_xlat41);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat5.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat7.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat28.x;
    u_xlat7.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat3.x;
    u_xlat3.xzw = (-u_xlat6.xyz) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xy = texture(_Sampler6050, u_xlat2.xy).xy;
    u_xlat2.xy = _Clouds2tiling.xy * u_xlat7.xy + u_xlat16_2.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + u_xlat16_4.xzw;
    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat16.xxx;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xzw;
    u_xlat3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = _StarsColor.xyz * vec3(u_xlat40) + _Color_Center.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat40 = (-_CloudsSmoothstepMin) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz + (-vec3(_CloudsSmoothstepMin));
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = _HighlightColor.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat41 = u_xlat40 * u_xlat40;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat40 = (-u_xlat40) * u_xlat41 + 1.0;
    u_xlat40 = u_xlat40 * vs_COLOR0.x;
    u_xlat16_8.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_8.xxx) + (-u_xlat1.xyz);
    u_xlat4.xyz = vs_TEXCOORD1.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_9.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_9.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_9.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat4.xyz = vec3(u_xlat41) * u_xlat16_8.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat5.y, u_xlat5.x);
        u_xlat41 = min(u_xlat5.z, u_xlat41);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat41) + u_xlat5.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, 6.0);
    u_xlat16_47 = u_xlat16_4.w + -1.0;
    u_xlat16_47 = unity_SpecCube0_HDR.w * u_xlat16_47 + 1.0;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * unity_SpecCube0_HDR.y;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(u_xlat16_47);
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb41 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb41){
#ifdef UNITY_ADRENO_ES3
        u_xlatb41 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb41 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb41){
            u_xlat41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat41 = inversesqrt(u_xlat41);
            u_xlat5.xyz = vec3(u_xlat41) * u_xlat16_8.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat41 = min(u_xlat6.y, u_xlat6.x);
            u_xlat41 = min(u_xlat6.z, u_xlat41);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat41) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_8.x = u_xlat16_5.w + -1.0;
        u_xlat16_8.x = unity_SpecCube1_HDR.w * u_xlat16_8.x + 1.0;
        u_xlat16_8.x = log2(u_xlat16_8.x);
        u_xlat16_8.x = u_xlat16_8.x * unity_SpecCube1_HDR.y;
        u_xlat16_8.x = exp2(u_xlat16_8.x);
        u_xlat16_8.x = u_xlat16_8.x * unity_SpecCube1_HDR.x;
        u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_8.xxx;
        u_xlat4.xyz = vec3(u_xlat16_47) * u_xlat16_4.xyz + (-u_xlat16_8.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat41 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat4.xyz = vec3(u_xlat41) * vs_TEXCOORD1.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat0.x + u_xlat0.x;
    u_xlat16_47 = u_xlat16_47 * u_xlat0.x + -0.5;
    u_xlat16_48 = (-u_xlat1.x) + 1.0;
    u_xlat16_49 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat16_48 = u_xlat16_47 * u_xlat16_48 + 1.0;
    u_xlat16_49 = -abs(u_xlat39) + 1.0;
    u_xlat16_12 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_12;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_49 + 1.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_48;
    u_xlat13.x = u_xlat1.x * u_xlat16_47;
    u_xlat26 = abs(u_xlat39) + u_xlat1.x;
    u_xlat26 = u_xlat26 + 9.99999975e-06;
    u_xlat26 = 0.5 / u_xlat26;
    u_xlat26 = u_xlat1.x * u_xlat26;
    u_xlat26 = u_xlat26 * 0.999999881;
    u_xlat16_9.xyz = _LightColor0.xyz * u_xlat13.xxx + u_xlat16_9.xyz;
    u_xlat13.xyz = vec3(u_xlat26) * _LightColor0.xyz;
    u_xlat16_47 = (-u_xlat0.x) + 1.0;
    u_xlat16_48 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_48;
    u_xlat16_47 = u_xlat16_47 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat13.xyz * vec3(u_xlat16_47);
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_47 = u_xlat16_49 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(u_xlat16_47) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat40;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
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
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
uniform 	vec4 _HighlightColor;
uniform 	float _CloudsSmoothstepMin;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bvec3 u_xlatb11;
mediump float u_xlat16_12;
vec3 u_xlat13;
vec2 u_xlat16;
float u_xlat26;
vec2 u_xlat28;
bool u_xlatb28;
float u_xlat30;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb43;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat2.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_T_VFX_noise_dots, u_xlat2.xy).xyz;
    u_xlat40 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat2.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat28.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.x = dot(u_xlat28.xy, u_xlat28.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat16.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat4.xy = u_xlat3.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat16.xy = vec2(1.0, 1.0) / u_xlat16.xy;
    u_xlat16.xy = u_xlat16.xy * u_xlat4.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat16.xy = u_xlat16.xy * u_xlat16.xy;
    u_xlat16.x = (-u_xlat4.x) * u_xlat16.x + 1.0;
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = min(abs(u_xlat28.y), abs(u_xlat28.x));
    u_xlat4.x = max(abs(u_xlat28.y), abs(u_xlat28.x));
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat42 = u_xlat42 * u_xlat4.x;
    u_xlat4.x = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat4.x * 0.0208350997 + -0.0851330012;
    u_xlat30 = u_xlat4.x * u_xlat30 + 0.180141002;
    u_xlat30 = u_xlat4.x * u_xlat30 + -0.330299497;
    u_xlat4.x = u_xlat4.x * u_xlat30 + 0.999866009;
    u_xlat30 = u_xlat42 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(abs(u_xlat28.y)<abs(u_xlat28.x));
#else
    u_xlatb43 = abs(u_xlat28.y)<abs(u_xlat28.x);
#endif
    u_xlat30 = u_xlat30 * -2.0 + 1.57079637;
    u_xlat30 = u_xlatb43 ? u_xlat30 : float(0.0);
    u_xlat42 = u_xlat42 * u_xlat4.x + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat28.y<(-u_xlat28.y));
#else
    u_xlatb4 = u_xlat28.y<(-u_xlat28.y);
#endif
    u_xlat4.x = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat42 = u_xlat42 + u_xlat4.x;
    u_xlat4.x = min(u_xlat28.y, u_xlat28.x);
    u_xlat28.x = max(u_xlat28.y, u_xlat28.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(u_xlat4.x<(-u_xlat4.x));
#else
    u_xlatb41 = u_xlat4.x<(-u_xlat4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat28.x>=(-u_xlat28.x));
#else
    u_xlatb28 = u_xlat28.x>=(-u_xlat28.x);
#endif
    u_xlatb28 = u_xlatb28 && u_xlatb41;
    u_xlat28.x = (u_xlatb28) ? (-u_xlat42) : u_xlat42;
    u_xlat28.x = u_xlat28.x * 0.159154937;
    u_xlat28.x = fract(u_xlat28.x);
    u_xlat5.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat28.x;
    u_xlat5.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat3.x;
    u_xlat16_4.xz = texture(_Sampler607, u_xlat2.xy).xy;
    u_xlat4.xz = _Clouds1Tiling.xy * u_xlat5.xy + u_xlat16_4.xz;
    u_xlat16_4.xzw = texture(_MinimizeClouds, u_xlat4.xz).xyz;
    u_xlat41 = (-u_xlat4.y) * u_xlat16.y + u_xlat16.x;
    u_xlat41 = u_xlat41 + 1.0;
    u_xlat5.xyz = u_xlat16_4.xzw + vec3(u_xlat41);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat5.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat7.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat28.x;
    u_xlat7.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat3.x;
    u_xlat3.xzw = (-u_xlat6.xyz) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xy = texture(_Sampler6050, u_xlat2.xy).xy;
    u_xlat2.xy = _Clouds2tiling.xy * u_xlat7.xy + u_xlat16_2.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + u_xlat16_4.xzw;
    u_xlat2.xyz = (-u_xlat2.xyz) + u_xlat16.xxx;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xzw;
    u_xlat3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = _StarsColor.xyz * vec3(u_xlat40) + _Color_Center.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat40 = (-_CloudsSmoothstepMin) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz + (-vec3(_CloudsSmoothstepMin));
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat2.xyz = _HighlightColor.xyz * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat40 = (-u_xlat40) + 1.0;
    u_xlat41 = u_xlat40 * u_xlat40;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat40 = (-u_xlat40) * u_xlat41 + 1.0;
    u_xlat40 = u_xlat40 * vs_COLOR0.x;
    u_xlat16_8.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_8.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_8.xxx) + (-u_xlat1.xyz);
    u_xlat4.xyz = vs_TEXCOORD1.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_9.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_9.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_9.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb41 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat4.xyz = vec3(u_xlat41) * u_xlat16_8.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat5.y, u_xlat5.x);
        u_xlat41 = min(u_xlat5.z, u_xlat41);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat41) + u_xlat5.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_8.xyz;
    }
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, 6.0);
    u_xlat16_47 = u_xlat16_4.w + -1.0;
    u_xlat16_47 = unity_SpecCube0_HDR.w * u_xlat16_47 + 1.0;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * unity_SpecCube0_HDR.y;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_4.xyz * vec3(u_xlat16_47);
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb41 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb41){
#ifdef UNITY_ADRENO_ES3
        u_xlatb41 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb41 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb41){
            u_xlat41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
            u_xlat41 = inversesqrt(u_xlat41);
            u_xlat5.xyz = vec3(u_xlat41) * u_xlat16_8.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat41 = min(u_xlat6.y, u_xlat6.x);
            u_xlat41 = min(u_xlat6.z, u_xlat41);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat41) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_8.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_8.x = u_xlat16_5.w + -1.0;
        u_xlat16_8.x = unity_SpecCube1_HDR.w * u_xlat16_8.x + 1.0;
        u_xlat16_8.x = log2(u_xlat16_8.x);
        u_xlat16_8.x = u_xlat16_8.x * unity_SpecCube1_HDR.y;
        u_xlat16_8.x = exp2(u_xlat16_8.x);
        u_xlat16_8.x = u_xlat16_8.x * unity_SpecCube1_HDR.x;
        u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_8.xxx;
        u_xlat4.xyz = vec3(u_xlat16_47) * u_xlat16_4.xyz + (-u_xlat16_8.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat41 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat4.xyz = vec3(u_xlat41) * vs_TEXCOORD1.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_47 = u_xlat0.x + u_xlat0.x;
    u_xlat16_47 = u_xlat16_47 * u_xlat0.x + -0.5;
    u_xlat16_48 = (-u_xlat1.x) + 1.0;
    u_xlat16_49 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat16_48 = u_xlat16_47 * u_xlat16_48 + 1.0;
    u_xlat16_49 = -abs(u_xlat39) + 1.0;
    u_xlat16_12 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_12;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_49 + 1.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_48;
    u_xlat13.x = u_xlat1.x * u_xlat16_47;
    u_xlat26 = abs(u_xlat39) + u_xlat1.x;
    u_xlat26 = u_xlat26 + 9.99999975e-06;
    u_xlat26 = 0.5 / u_xlat26;
    u_xlat26 = u_xlat1.x * u_xlat26;
    u_xlat26 = u_xlat26 * 0.999999881;
    u_xlat16_9.xyz = _LightColor0.xyz * u_xlat13.xxx + u_xlat16_9.xyz;
    u_xlat13.xyz = vec3(u_xlat26) * _LightColor0.xyz;
    u_xlat16_47 = (-u_xlat0.x) + 1.0;
    u_xlat16_48 = u_xlat16_47 * u_xlat16_47;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_48;
    u_xlat16_47 = u_xlat16_47 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat13.xyz * vec3(u_xlat16_47);
    u_xlat0.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_47 = u_xlat16_49 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_8.xyz * vec3(u_xlat16_47) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat40;
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
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 102452
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_10;
vec2 u_xlat12;
mediump vec2 u_xlat16_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat18 = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat18 + u_xlat12.x;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb6 = u_xlatb6 && u_xlatb18;
    u_xlat6.x = (u_xlatb6) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat6.x = u_xlat6.x * 0.159154937;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat1.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat2.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat6.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_13.xy = texture(_Sampler6050, u_xlat6.xy).xy;
    u_xlat16_6.xy = texture(_Sampler607, u_xlat6.xy).xy;
    u_xlat1.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat1.xy = _Clouds2tiling.xy * u_xlat1.xy + u_xlat16_13.xy;
    u_xlat16_1.xyz = texture(_MinimizeClouds, u_xlat1.xy).xyz;
    u_xlat2.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat0.xw = u_xlat0.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat6.xy = _Clouds1Tiling.xy * u_xlat2.xy + u_xlat16_6.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat6.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat12.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = (-u_xlat12.x) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat0.xxx;
    u_xlat0.x = (-u_xlat12.y) * u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.xyz = u_xlat16_2.xyz + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat1.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_VFX_noise_dots, u_xlat1.xy).xyz;
    u_xlat18 = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = _StarsColor.xyz * vec3(u_xlat18) + _Color_Center.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat18 + u_xlat18;
    u_xlat16_21 = u_xlat16_21 * u_xlat18 + -0.5;
    u_xlat16_4 = (-u_xlat18) + 1.0;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = -abs(u_xlat18) + 1.0;
    u_xlat12.x = abs(u_xlat18) + u_xlat6.x;
    u_xlat12.x = u_xlat12.x + 9.99999975e-06;
    u_xlat12.x = 0.5 / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.999999881;
    u_xlat16_16 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_16;
    u_xlat16_10.x = u_xlat16_21 * u_xlat16_10.x + 1.0;
    u_xlat16_16 = (-u_xlat6.x) + 1.0;
    u_xlat16_22 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_16 = u_xlat16_16 * u_xlat16_22;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_16 + 1.0;
    u_xlat16_21 = u_xlat16_10.x * u_xlat16_21;
    u_xlat6.x = u_xlat6.x * u_xlat16_21;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = texture(_LightTexture0, vec2(u_xlat18)).x;
    u_xlat16_10.xyz = vec3(u_xlat18) * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat16_10.xyz;
    u_xlat16_21 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_4 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * 0.959999979 + 0.0399999991;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_21);
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + u_xlat6.xyz;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
bool u_xlatb5;
bool u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_14;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat10.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat15 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10.x = u_xlat10.x * u_xlat15;
    u_xlat15 = u_xlat10.x * u_xlat10.x;
    u_xlat1.x = u_xlat15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat15 * u_xlat1.x + -0.330299497;
    u_xlat15 = u_xlat15 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat15 * u_xlat10.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb6 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb6 ? u_xlat1.x : float(0.0);
    u_xlat10.x = u_xlat10.x * u_xlat15 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb15 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat10.x = u_xlat15 + u_xlat10.x;
    u_xlat15 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<(-u_xlat15));
#else
    u_xlatb15 = u_xlat15<(-u_xlat15);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb5 = u_xlatb5 && u_xlatb15;
    u_xlat5.x = (u_xlatb5) ? (-u_xlat10.x) : u_xlat10.x;
    u_xlat5.x = u_xlat5.x * 0.159154937;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat1.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat5.x;
    u_xlat2.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat5.x;
    u_xlat5.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_11.xy = texture(_Sampler6050, u_xlat5.xy).xy;
    u_xlat16_5.xy = texture(_Sampler607, u_xlat5.xy).xy;
    u_xlat1.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat1.xy = _Clouds2tiling.xy * u_xlat1.xy + u_xlat16_11.xy;
    u_xlat16_1.xyz = texture(_MinimizeClouds, u_xlat1.xy).xyz;
    u_xlat2.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat0.xw = u_xlat0.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat5.xy = _Clouds1Tiling.xy * u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat5.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat5.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat5.xy = vec2(1.0, 1.0) / u_xlat5.xy;
    u_xlat0.xy = u_xlat5.xy * u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat10.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = (-u_xlat10.x) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat0.xxx;
    u_xlat0.x = (-u_xlat10.y) * u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.xyz = u_xlat16_2.xyz + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat1.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_VFX_noise_dots, u_xlat1.xy).xyz;
    u_xlat15 = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat1.xyz = _StarsColor.xyz * vec3(u_xlat15) + _Color_Center.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat15) + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat15 + u_xlat15;
    u_xlat16_18 = u_xlat16_18 * u_xlat15 + -0.5;
    u_xlat16_4 = (-u_xlat15) + 1.0;
    u_xlat15 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * vs_TEXCOORD1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat5.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = -abs(u_xlat15) + 1.0;
    u_xlat10.x = abs(u_xlat15) + u_xlat5.x;
    u_xlat10.x = u_xlat10.x + 9.99999975e-06;
    u_xlat10.x = 0.5 / u_xlat10.x;
    u_xlat10.x = u_xlat5.x * u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 0.999999881;
    u_xlat1.xyz = u_xlat10.xxx * _LightColor0.xyz;
    u_xlat16_14 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_14;
    u_xlat16_9.x = u_xlat16_18 * u_xlat16_9.x + 1.0;
    u_xlat16_14 = (-u_xlat5.x) + 1.0;
    u_xlat16_19 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_19;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14 + 1.0;
    u_xlat16_18 = u_xlat16_9.x * u_xlat16_18;
    u_xlat5.x = u_xlat5.x * u_xlat16_18;
    u_xlat16_9.xyz = u_xlat5.xxx * _LightColor0.xyz;
    u_xlat16_18 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_4 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * 0.959999979 + 0.0399999991;
    u_xlat5.xyz = u_xlat1.xyz * vec3(u_xlat16_18);
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat16_9.xyz + u_xlat5.xyz;
    u_xlat5.x = u_xlat0.x * u_xlat0.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat0.x = (-u_xlat0.x) * u_xlat5.x + 1.0;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(5) uniform highp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
bool u_xlatb6;
bool u_xlatb7;
mediump float u_xlat16_11;
vec2 u_xlat12;
mediump vec2 u_xlat16_13;
mediump float u_xlat16_17;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat18 = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat18 + u_xlat12.x;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb6 = u_xlatb6 && u_xlatb18;
    u_xlat6.x = (u_xlatb6) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat6.x = u_xlat6.x * 0.159154937;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat1.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat2.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat6.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_13.xy = texture(_Sampler6050, u_xlat6.xy).xy;
    u_xlat16_6.xy = texture(_Sampler607, u_xlat6.xy).xy;
    u_xlat1.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat1.xy = _Clouds2tiling.xy * u_xlat1.xy + u_xlat16_13.xy;
    u_xlat16_1.xyz = texture(_MinimizeClouds, u_xlat1.xy).xyz;
    u_xlat2.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat0.xw = u_xlat0.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat6.xy = _Clouds1Tiling.xy * u_xlat2.xy + u_xlat16_6.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat6.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat12.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = (-u_xlat12.x) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat0.xxx;
    u_xlat0.x = (-u_xlat12.y) * u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.xyz = u_xlat16_2.xyz + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat1.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_VFX_noise_dots, u_xlat1.xy).xyz;
    u_xlat18 = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = _StarsColor.xyz * vec3(u_xlat18) + _Color_Center.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat18 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat16_21 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_21 = u_xlat18 * u_xlat16_21;
    u_xlat16_21 = u_xlat0.x * u_xlat16_21;
    u_xlat16_4.xyz = vec3(u_xlat16_21) * _LightColor0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat18 + u_xlat18;
    u_xlat16_21 = u_xlat16_21 * u_xlat18 + -0.5;
    u_xlat16_22 = (-u_xlat18) + 1.0;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_5 = -abs(u_xlat18) + 1.0;
    u_xlat12.x = abs(u_xlat18) + u_xlat6.x;
    u_xlat12.x = u_xlat12.x + 9.99999975e-06;
    u_xlat12.x = 0.5 / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.999999881;
    u_xlat1.xyz = u_xlat16_4.xyz * u_xlat12.xxx;
    u_xlat16_11 = u_xlat16_5 * u_xlat16_5;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_11;
    u_xlat16_5 = u_xlat16_21 * u_xlat16_5 + 1.0;
    u_xlat16_11 = (-u_xlat6.x) + 1.0;
    u_xlat16_17 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_17;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_11 + 1.0;
    u_xlat16_21 = u_xlat16_5 * u_xlat16_21;
    u_xlat6.x = u_xlat6.x * u_xlat16_21;
    u_xlat16_4.xyz = u_xlat6.xxx * u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_22 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * 0.959999979 + 0.0399999991;
    u_xlat6.xyz = u_xlat1.xyz * vec3(u_xlat16_21);
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat6.xyz;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(5) uniform highp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_10;
vec2 u_xlat12;
mediump vec2 u_xlat16_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat18 = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat18 + u_xlat12.x;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb6 = u_xlatb6 && u_xlatb18;
    u_xlat6.x = (u_xlatb6) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat6.x = u_xlat6.x * 0.159154937;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat1.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat2.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat6.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_13.xy = texture(_Sampler6050, u_xlat6.xy).xy;
    u_xlat16_6.xy = texture(_Sampler607, u_xlat6.xy).xy;
    u_xlat1.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat1.xy = _Clouds2tiling.xy * u_xlat1.xy + u_xlat16_13.xy;
    u_xlat16_1.xyz = texture(_MinimizeClouds, u_xlat1.xy).xyz;
    u_xlat2.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat0.xw = u_xlat0.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat6.xy = _Clouds1Tiling.xy * u_xlat2.xy + u_xlat16_6.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat6.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat12.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = (-u_xlat12.x) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat0.xxx;
    u_xlat0.x = (-u_xlat12.y) * u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.xyz = u_xlat16_2.xyz + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat1.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_VFX_noise_dots, u_xlat1.xy).xyz;
    u_xlat18 = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = _StarsColor.xyz * vec3(u_xlat18) + _Color_Center.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat18 + u_xlat18;
    u_xlat16_21 = u_xlat16_21 * u_xlat18 + -0.5;
    u_xlat16_4 = (-u_xlat18) + 1.0;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = -abs(u_xlat18) + 1.0;
    u_xlat12.x = abs(u_xlat18) + u_xlat6.x;
    u_xlat12.x = u_xlat12.x + 9.99999975e-06;
    u_xlat12.x = 0.5 / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.999999881;
    u_xlat16_16 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_16;
    u_xlat16_10.x = u_xlat16_21 * u_xlat16_10.x + 1.0;
    u_xlat16_16 = (-u_xlat6.x) + 1.0;
    u_xlat16_22 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_16 = u_xlat16_16 * u_xlat16_22;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_16 + 1.0;
    u_xlat16_21 = u_xlat16_10.x * u_xlat16_21;
    u_xlat6.x = u_xlat6.x * u_xlat16_21;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = texture(_LightTexture0, u_xlat1.xyz).w;
    u_xlat18 = texture(_LightTextureB0, vec2(u_xlat18)).x;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat16_10.xyz = vec3(u_xlat18) * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat16_10.xyz;
    u_xlat16_21 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_4 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * 0.959999979 + 0.0399999991;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_21);
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + u_xlat6.xyz;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _StarsColor;
uniform 	vec4 _Color_Center;
uniform 	vec4 _Color;
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	float _CoreSmoothStepMin;
uniform 	float _CoreSmoothStepMax;
uniform 	vec2 _Clouds1Tiling;
uniform 	vec2 _Clouds1PanningSpeed;
uniform 	vec2 _Clouds2tiling;
uniform 	vec2 _Clouds2PanningSpeed;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_noise_dots;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler607;
UNITY_LOCATION(2) uniform mediump sampler2D _MinimizeClouds;
UNITY_LOCATION(3) uniform mediump sampler2D _Sampler6050;
UNITY_LOCATION(4) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_10;
vec2 u_xlat12;
mediump vec2 u_xlat16_13;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat18 = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat18 + u_xlat12.x;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb6 = u_xlatb6 && u_xlatb18;
    u_xlat6.x = (u_xlatb6) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat6.x = u_xlat6.x * 0.159154937;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat1.x = _Clouds2PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat2.x = _Clouds1PanningSpeed.xxxy.z * _Time.y + u_xlat6.x;
    u_xlat6.xy = vs_TEXCOORD0.xy + vs_TEXCOORD0.xy;
    u_xlat16_13.xy = texture(_Sampler6050, u_xlat6.xy).xy;
    u_xlat16_6.xy = texture(_Sampler607, u_xlat6.xy).xy;
    u_xlat1.y = _Clouds2PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat1.xy = _Clouds2tiling.xy * u_xlat1.xy + u_xlat16_13.xy;
    u_xlat16_1.xyz = texture(_MinimizeClouds, u_xlat1.xy).xyz;
    u_xlat2.y = _Clouds1PanningSpeed.xxxy.w * _Time.y + u_xlat0.x;
    u_xlat0.xw = u_xlat0.xx + (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin));
    u_xlat6.xy = _Clouds1Tiling.xy * u_xlat2.xy + u_xlat16_6.xy;
    u_xlat16_2.xyz = texture(_MinimizeClouds, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat6.xy = (-vec2(_RadialGradientSmoothstepMin, _CoreSmoothStepMin)) + vec2(_RadialGradientSmoothstepMax, _CoreSmoothStepMax);
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat12.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = (-u_xlat12.x) * u_xlat0.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat1.xyz = (-u_xlat1.xyz) + u_xlat0.xxx;
    u_xlat0.x = (-u_xlat12.y) * u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.xyz = u_xlat16_2.xyz + u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(1.5, 1.5);
    u_xlat1.xy = _Time.yy * vec2(0.00999999978, 0.00999999978) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_T_VFX_noise_dots, u_xlat1.xy).xyz;
    u_xlat18 = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = _StarsColor.xyz * vec3(u_xlat18) + _Color_Center.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat18 + u_xlat18;
    u_xlat16_21 = u_xlat16_21 * u_xlat18 + -0.5;
    u_xlat16_4 = (-u_xlat18) + 1.0;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = -abs(u_xlat18) + 1.0;
    u_xlat12.x = abs(u_xlat18) + u_xlat6.x;
    u_xlat12.x = u_xlat12.x + 9.99999975e-06;
    u_xlat12.x = 0.5 / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.999999881;
    u_xlat16_16 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_16 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_16;
    u_xlat16_10.x = u_xlat16_21 * u_xlat16_10.x + 1.0;
    u_xlat16_16 = (-u_xlat6.x) + 1.0;
    u_xlat16_22 = u_xlat16_16 * u_xlat16_16;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_16 = u_xlat16_16 * u_xlat16_22;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_16 + 1.0;
    u_xlat16_21 = u_xlat16_10.x * u_xlat16_21;
    u_xlat6.x = u_xlat6.x * u_xlat16_21;
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat18 = texture(_LightTexture0, u_xlat1.xy).w;
    u_xlat16_10.xyz = vec3(u_xlat18) * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat16_10.xyz;
    u_xlat16_21 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_4 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * 0.959999979 + 0.0399999991;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_21);
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + u_xlat6.xyz;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.x;
    SV_Target0 = u_xlat1;
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
 Pass {
  Name "ShadowCaster"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 232161
Program "vp" {
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "UNITY_PASS_SHADOWCASTER" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat2.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb0 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
UNITY_LOCATION(0) uniform mediump sampler3D _DitherMaskLOD;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_7;
float u_xlat9;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat0.x = (-u_xlat0.x) * u_xlat3 + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.x;
    u_xlat16_7 = u_xlat0.x * 0.9375;
    u_xlat1.z = u_xlat16_7;
    u_xlat1.xy = hlslcc_FragCoord.xy * vec2(0.25, 0.25);
    u_xlat16_0 = texture(_DitherMaskLOD, u_xlat1.xyz).w;
    u_xlat16_2 = u_xlat16_0 + -0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2<0.0);
#else
    u_xlatb0 = u_xlat16_2<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" "UNITY_PASS_SHADOWCASTER" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat2.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb0 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
UNITY_LOCATION(0) uniform mediump sampler3D _DitherMaskLOD;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_7;
float u_xlat9;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat0.x = (-u_xlat0.x) * u_xlat3 + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.x;
    u_xlat16_7 = u_xlat0.x * 0.9375;
    u_xlat1.z = u_xlat16_7;
    u_xlat1.xy = hlslcc_FragCoord.xy * vec2(0.25, 0.25);
    u_xlat16_0 = texture(_DitherMaskLOD, u_xlat1.xyz).w;
    u_xlat16_2 = u_xlat16_0 + -0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2<0.0);
#else
    u_xlatb0 = u_xlat16_2<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "UNITY_PASS_SHADOWCASTER" }
""
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" "UNITY_PASS_SHADOWCASTER" }
""
}
}
}
}
Fallback "Diffuse"
CustomEditor "ASEMaterialInspector"
}