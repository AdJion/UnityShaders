Shader"CG Shader with all bulit-in vertex input parameters"
{
	SubShader
	{
		Pass
		{
			CGPROGRAME
			#pragma vertex vert
			#pragma fragment frag
			//#include"CGUnity.cginc"
			struct VertexInput
			{
				float4 vertex:POSITION;
				float3 normal:NORMAL;
				float4 tangent:TANGENT;
				float4 texcoord0:TEXCOORD0;
				float4 texcoord1:TEXCOORD1;
				float4 color:COLOR;
			};//只有法线Normal是三维的，其他的都是float4
			struct VertexOuput
			{
				float4 pos:SV_POSITION;
				float4 col:COLOR;
			};

			VertexOutput vert(VertexInput input)
			{
				VertexOuput output;
				output.pos=mul(UNITY_MATRIX_MVP,input.vertex);
				output.col=input.col;
				//测试代码
//				output.col=float4(input.normal,1.0);
//				output.col=input.tangent;
//				output.col=input.texcoord0;
//				output.col=input.texcoord1;
//				ouptut.col=input.vertex;
			}
			float4 frag(VertexOutput input):COLOR
			{
				return input.col;
			}

			ENDCG
		}
	}
}