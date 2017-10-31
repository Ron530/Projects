import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
public class DeBruijn{

  public static void main(String[] args){
     try{
	int k = Integer.parseInt(args[0]);

	BufferedReader br = 
		new BufferedReader ( 
			new InputStreamReader( 
			
	new FileInputStream( 
					new File(args[1]))));
	
	String sequence = br.readLine(); //assumes sequence is in first line of file

	System.out.println("Sequence: "+sequence);

	System.out.println("SequenceRC:"+getRevComp(sequence));

	HashMap kmerMap = new HashMap();

	Node topNode = null;

	for(int i=0; i<=sequence.length()-k; i++){
		String kmer = sequence.substring(i,i+k);	//e.g. ATCAT

		Node result =(Node)kmerMap.get(kmer);

		if(result==null){	//kmer not yet in hashmap
			result = new Node();
			result.kmerF=kmer;
			result.kmerR=getRevComp(kmer);
			kmerMap.put(kmer,result);
		}
		result.count++;

		if(i>0){	//connect this kmer node to the previous kmer node
			Node prevNode = (Node)kmerMap.get(sequence.substring(i-1,i+k-1));
			switch(kmer.charAt(k-1)){
				case 'A': prevNode.nodeA=result; break;
				case 'T': prevNode.nodeT=result; break;
				case 'C': prevNode.nodeC=result; break;
				case 'G': prevNode.nodeG=result; break;
			}
		}else{
			topNode=result;
		}
		
	}	

	BufferedWriter bw = 
		new BufferedWriter ( 
			new OutputStreamWriter( 
				new FileOutputStream( 
					new File(args[2]))));


	Iterator it = kmerMap.entrySet().iterator();
	while(it.hasNext()){
		Map.Entry entry = (Map.Entry) it.next();
		String key = (String)entry.getKey();
		Node value = (Node)entry.getValue();
		System.out.println(value+"\t"+value.kmerF+"\t"+value.count+"\t"+value.nodeA+"\t"+value.nodeT+"\t"+value.nodeC+"\t"+value.nodeG);		
		if(value.nodeA!=null){
			bw.write(value+"\t"+value.nodeA+"\t"+value.count+"\n");
		}
		if(value.nodeT!=null){
			bw.write(value+"\t"+value.nodeT+"\t"+value.count+"\n");
		}
		if(value.nodeC!=null){
			bw.write(value+"\t"+value.nodeC+"\t"+value.count+"\n");
		}
		if(value.nodeG!=null){
			
bw.write(value+"\t"+value.nodeG+"\t"+value.count+"\n");
		}
	}

	bw.flush();
	bw.close();
	
      }catch(IOException ioe){}
  }

  static String getRevComp(String kmer){
	String kmerR="";
	for(int i=kmer.length()-1; i>=0; i--){
		switch(kmer.charAt(i)){
			case 'A': kmerR+='T'; break;
			case 'T': kmerR+='A'; break;
			case 'C': kmerR+='G'; break;
			case 'G': kmerR+='C'; break;
		}
	}
	return kmerR;
  }

}

class Node{
	String kmerF=null;
	String kmerR=null;
	int count=0;
	Node nodeA=null;
	Node nodeT=null;
	Node nodeC=null;
	Node nodeG=null;

}

