/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package practicaenclase.recursividad;

/**
 *
 * @author Estudiante - Lab23
 */
public class PracticaEnClaseRecursividad {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        factoresImpares(5);
    }
    public static void factoresImpares(int n){
        for (int i = 1; i <=n; i++) {
            for (int j = 1; j <=n; j++) {
                if((i % 2 != 0 )&&(j % 2 !=0 )){
                    System.out.println(i+" x "+j+" = "+i*j);
                }
            }
  
        }
    }
    public static void factoresPares(int n){
        for (int i = 1; i <=n; i++) {
            for (int j = 1; j <=n; j++) {
                if((i % 2 == 0 )&&(j % 2 ==0 )){
                    System.out.println(i+" x "+j+" = "+i*j);
                }
            }
  
        }
    }
    public static void factoresIguales(int n){
        for (int i = 1; i <=n; i++) {
            for (int j = 1; j <=n; j++) {
                if(i==j){
                    System.out.println(i+" x "+j+" = "+i*j);
                }
            }
  
        }
    }
    public static void factoresParImpPar(int n){
        for (int i = 1; i <=n; i++) {
            if (i % 2 != 0){
            for (int j = 1; j <=n; j++) {
                if(j%2 == 0){
                    System.out.println(i+" x "+j+" = "+i*j);
                }
            }
            }else if (i % 2 == 0){
                for (int j = 1; j <=n; j++) {
                if(j%2 != 0){
                    System.out.println(i+" x "+j+" = "+i*j);
                }
            }
            }
  
        }
    
    }
    public static void factoresCrecDecr(int n){
        for (int i = 1; i <=n; i++) {
            for (int j = n; j >=1; j--) {
                    System.out.println(i+" x "+j+" = "+i*j);
            }
  
        }
    }
    /*RECURSIVOS*/
    public static void factoresImparesR(int n){
        factoresImparesR(n,1);
    }
    private static void factoresImparesR(int n,int i){
        if(i>n) return;
        factoresImparesR(n,i,1);
        factoresImparesR(n,i+1);
    }
    private static void factoresImparesR(int n,int i, int j){
        if(j>n) return;
        if ((i %2 != 0)&&(j % 2 != 0)){
            System.out.println(i+" x "+j+" = "+i*j);
            factoresImparesR(n,i,j+1);
        }else{
            factoresImparesR(n,i,j+1);
        }
    }
    
    public static void factoresParesR(int n){
        factoresParesR(n,1);
    }
    private static void factoresParesR(int n,int i){
        if(i>n) return;
        factoresParesR(n,i,1);
        factoresParesR(n,i+1);
    }
    private static void factoresParesR(int n,int i, int j){
        if(j>n) return;
        if ((i %2 == 0)&&(j % 2 == 0)){
            System.out.println(i+" x "+j+" = "+i*j);
            factoresParesR(n,i,j+1);
        }else{
            factoresParesR(n,i,j+1);
        }
    }
    
    public static void factoresIgualesR(int n){
        factoresIgualesR(n,1);
    }
    private static void factoresIgualesR(int n,int i){
        if(i>n) return;
        factoresIgualesR(n,i,1);
        factoresIgualesR(n,i+1);
    }
    private static void factoresIgualesR(int n,int i, int j){
        if(j>n) return;
        if (i==j){
            System.out.println(i+" x "+j+" = "+i*j);
            factoresIgualesR(n,i,j+1);
        }else{
            factoresIgualesR(n,i,j+1);
        }
    }
    
    public static void factoresParImpParR(int n){
        factoresParImpParR(n,1);
    }
    private static void factoresParImpParR(int n,int i){
        if(i>n) return;
        if(i%2!=0){
        factoresParImpParR(n,i,1);
        }else if (i%2==0){
         factoresParImpParRR(n,i,1); 
        }
        factoresParImpParR(n,i+1);
    }
    private static void factoresParImpParR(int n,int i, int j){
        if(j>n) return;
        if (j%2==0){
            System.out.println(i+" x "+j+" = "+i*j);
            factoresParImpParR(n,i,j+1);
        }else{
            factoresParImpParR(n,i,j+1);
        }
    }
    private static void factoresParImpParRR(int n,int i, int j){
        if(j>n) return;
        if (j%2!=0){
            System.out.println(i+" x "+j+" = "+i*j);
            factoresParImpParRR(n,i,j+1);
        }else{
            factoresParImpParRR(n,i,j+1);
        }
    }
    
    public static void factoresCrecDecrR(int n){
        factoresCrecDecrR(n,1);
    }
    private static void factoresCrecDecrR(int n,int i){
        if(i>n) return;
        factoresCrecDecrR(n,i,n);
        factoresCrecDecrR(n,i+1);
    }
    private static void factoresCrecDecrR(int n,int i, int j){
        if(j<1) return;
        
            System.out.println(i+" x "+j+" = "+i*j);
            factoresCrecDecrR(n,i,j-1);
        
       
        
    }
}
