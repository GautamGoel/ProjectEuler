/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mypkg;

/**
 *
 * @author ashok
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int besti = 3;
        int bestNum = 0;
        for(int i = 3; i <= 1000; i++){
            System.out.println(numTriangles(i));
            int n = numTriangles(i);
            if(numTriangles(i) > bestNum){
                besti = i;
                bestNum = n;
            }
        }
        System.out.println(besti);
    }

    public static int numTriangles(int p){
        int count = 0;
        for(int i = p/3; i <= p/2; i++){ //i is biggest side length
            for(int j = 1; j + i < p; j++){
                int k = p - j - i;
                if(j*j + k*k == i*i){
                    count++;
                  //  System.out.println("i:" + i + ", j:" + j + ", k:" + k);
                }
                
            }
        }
        return(count);
    }

}
