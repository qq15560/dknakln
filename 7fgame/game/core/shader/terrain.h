

float4x4 g_m44Mvp; 
float3 g_f3LightWS ;

//float3 g_f3Amibient;
//float3 g_f3Diffuse;
//float3 g_f3EyeObj;


struct VsOutput_t
{
  float4 f4Pos		    : POSITION;  
  float2 f2Tex0       : TEXCOORD0;
  float2 f2Tex1       : TEXCOORD2;
  float4 f4Color      : COLOR0;
};


VsOutput_t TerrainVS_1_1 (  float3 f3Pos : POSITION, 
			                      float2 f2TexCoord    : TEXCOORD0,
			                      float3 f3NormalOS   : NORMAL,
                            float3 f3TangentOS  : TANGENT
                         )
{
    VsOutput_t Output;
    

	  float3 f3NormalWS   = normalize( f3NormalOS );
    float3 f3TangentWS  = normalize( f3TangentOS );
    float3 f3BinormalWS = normalize( cross(f3NormalWS, f3TangentWS) );

    float3x3 m33Tangent = float3x3 (f3TangentWS, f3BinormalWS, f3NormalWS);


    Output.f4Pos = mul (float4(f3Pos,1), g_m44Mvp);
    Output.f2Tex0 = f2TexCoord;
	  Output.f2Tex1 = f2TexCoord;
	
	  float3 f3LightOS = normalize (g_f3LightWS);

	  Output.f4Color.xyz = mul (m33Tangent, -f3LightOS) * 0.5 + 0.5;
    Output.f4Color.w = 1;

    return Output;    
}

technique Terrain
{
    pass
    {          
      VertexShader = compile vs_1_1 TerrainVS_1_1();
      PixelShader = NULL;
    }
}
