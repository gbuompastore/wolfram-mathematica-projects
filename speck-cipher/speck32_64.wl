(* ::Package:: *)

n=16  (* word size*)
m = 4  (* key words*)
rounds=22 (*Numero di round dell'algoritmo*)
alpha=7
beta=2 
ror[x_,p_]:=BitAnd[ BitOr[BitShiftRight[x,p] ,   BitShiftLeft[x,n-p]  ],65535]
rol[x_,p_]:=BitAnd[BitOr[BitShiftLeft[x,p] ,   BitShiftRight[x,n-p]  ],65535]
key={16^^1918,16^^1110,16^^908,16^^100} (* Chiave in formato Esadecimale*)
plaintext ={16^^6574,16^^694c} (* Testo di riferimento in Esadecimale*)


(* Funzione per la generazione del key scheduling *)
expandKey[k_]:=Module[{key,l,y},key=ConstantArray[0,24];
l=ConstantArray[0,24];

key[[1]]=k[[4]];
l[[1]]=k[[3]];
l[[2]]=k[[2]];
l[[3]]=k[[1]];

For[i=1,i<rounds,i++,
l[[i]]=BitAnd[ BitXor[ror[l[[i]],alpha]+key[[i]],i-1],65535];
	 y=BitAnd[BitXor[rol[key[[i]],beta],l[[i]]],65535];
	l[[i+m-1 ]]=l[[i]];
	key[[i+1]]=y;
];
	key
];
expandKey[key]


(* Funzione di encrypt*)
encrypt[pt_,k_]:=Module[{x,y,keyschedule,a,b},keyschedule=expandKey[k];
y=pt[[2]];
x=pt[[1]];
For[i=1,i<=rounds  ,i++,
x=BitAnd[BitXor[ror[x,alpha]+y,keyschedule[[i]]],65535];
y= BitAnd[BitXor[rol[y,beta],x],65535];
	];
{x,y}
];


decrypt[pt_,k_]:=Module[{x,y,keyschedule,a,b},keyschedule=expandKey[k];
y=pt[[2]];
x=pt[[1]];
For[i=rounds,i>=1  ,i--,
y= BitAnd[ror[BitXor[x,y],beta],65535];
x= BitAnd[BitXor[x,keyschedule[[i]]]-y,65535];
x= rol[x,alpha];
	];
{x,y}
];


v=encrypt[plaintext,key]
Map[IntegerString[#,16]&,v] (* Conversione degli elementi del vettore da Decimale ad Esadecimale *)


dec=decrypt[v,key]
Map[IntegerString[#,16]&,dec] 



