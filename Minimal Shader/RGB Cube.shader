//RGB CUBE.shader
//这个shader展示了怎么从Vertex里拿出数据，并进行修改后传递到Fragment里
//Vertex里面的顶点数据来源于Mesh Renderer组件，这个组件从Mesh Filter里拿到数据
//在每一帧里，Mesh Renderer组件会把游戏对象的表面数据发送给OpenGL,这个过程称为Draw Call
Shader"CG shader for RGB Cube"
{
	SubShader 
	{
	   Pass
	   {
	       CGPROGRAM
	       #pragma vertex vert
	       #pragma fragment frag
	       struct vertexOutput
	       {
	       		float4 pos:SV_POSITION;
	       		float4 col:TEXCOORD0;
	       };
	       vertexOutput vert(float4 vertexPos:POSITION)
	       {
	       		vertexOutput output;
	       		output.pos=mul(UNITY_MATRIX_MVP,vertexPos);
	       		output.col=vertexPos+float4(0.5,0.5,0.5,0);
	       		return output;
	       }
	       float4 frag(vertexOutput input):COLOR
	       {
	       		return input.col;
	       }
	       ENDCG
	   }
	}
}