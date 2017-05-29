/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package javaapplication3;

/**
 *
 * @author estudiante
 */
public class JavaApplication3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        // mostrarDiv(12);
        //System.out.println(primos(5));        
//System.out.println(sumaDivisores(12));
      // mostrarPrimos(1,12);  
        //System.out.println(cantidadDivisores(12));
        //System.out.println(sumaEnteros(3));
       // System.out.println(sumaDivisoresPrimos(12));
       // mostrarPerfectos(1,100);
       
        mostrarDivR(12,1);
    }
    
    public static void mostrarDiv(int n){
    int i=1;
    while(i<=n){
    if(n%i==0){
        System.out.println(i+" ");
    }
    i=i+1;
    }
    }
    public static boolean primos(int n) {
        int i = 2;
        int lim = (n / 2);
        while (i <= lim) {
            if (n % i == 0) {
                return false;
            }
            i = i + 1;
        }
        return true;
    }
    public static int sumaDivisores(int n){
    
        int i = 1;
        int c = 0;
        while (i <= n) {
            if (n % i == 0) {
                c = i + c;
            }
            i = i + 1;
        }

        return c;
    }
    public static void mostrarPrimos(int a,int b){
       int i=a;
        while(i<=b){
        if(primos(i)){
            System.out.println(i);
            
        }
        i++;
        }
    
    }
    public static int cantidadDivisores(int n){
     int i = 1;
        int c = 0;
        while (i <= n) {
            if (n % i == 0) {
                c = 1 + c;
            }
            i = i + 1;
        }

        return c;
    }
    public static int sumaEnteros(int n){
    int i=1;
    int c=0;
    while (i <= n) {
           c = i +c;
            i++;  
        }

        return c;
    }
    public static int sumaDivisoresPrimos(int n){
    
        int i = 1;
        int c = 0;
        while (i <= n) {
            if (n % i == 0) {
               if(primos(i)){
                c = c+i;
            }
            }
            i = i + 1;
        }

        return c;
    }
      public static boolean perfecto(int n){
    
        int i = 1;
        int c = 0;
        while (i <= n) {
            if (n % i == 0) {
                c = i + c;
            }
            i = i + 1;
        }
c=c-n;
        return c==n;
    }
      
    public static void mostrarPerfectos(int a,int b){
    int i=a;
        while(i<=b){
        if(perfecto(i)){
            System.out.println(i);
            
        }
        i++;
        }
    }
  public static void mostrarDivR(int n,int i){
    
    if(i>=n)return;
    if(n%i==0)
        System.out.println(i+" ");
    
    mostrarDivR(n,i=1+i);
    }
public static boolean primosR(int n) {
        int i = 2;
        int lim = (n / 2)return true;
        if (i >= lim)return; 
            if (n % i == 0) {
                return false;
            }
            i = i + 1;
        
        return true;
    }    
}

