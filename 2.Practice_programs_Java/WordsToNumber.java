import java.util.Map;
import java.util.HashMap;

public class WordsToNumber {

    private static final Map<String, Integer> numberMap = new HashMap<>();
    private static final Map<String, Integer> multiplierMap = new HashMap<>();

    static{
        numberMap.put("zero", 0);
        numberMap.put("one", 1);
        numberMap.put("two", 2);
        numberMap.put("three", 3);
        numberMap.put("four", 4);
        numberMap.put("five", 5);
        numberMap.put("six", 6);
        numberMap.put("seven", 7);
        numberMap.put("eight", 8);
        numberMap.put("nine", 9);
        numberMap.put("ten", 10);
        numberMap.put("eleven", 11);
        numberMap.put("twelve", 12);
        numberMap.put("thirteen", 13);
        numberMap.put("fourteen", 14);
        numberMap.put("fifteen", 15);
        numberMap.put("sixteen", 16);
        numberMap.put("seventeen", 17);
        numberMap.put("eighteen", 18);
        numberMap.put("nineteen", 19);

        // Tens
        numberMap.put("twenty", 20);
        numberMap.put("thirty", 30);
        numberMap.put("forty", 40);
        numberMap.put("fifty", 50);
        numberMap.put("sixty", 60);
        numberMap.put("seventy", 70);
        numberMap.put("eighty", 80);
        numberMap.put("ninety", 90);

        // Multipliers
        multiplierMap.put("hundred", 100);
        multiplierMap.put("thousand", 1000);
        multiplierMap.put("million", 1000000);
        multiplierMap.put("billion", 1000000000);
    }

    public static int convert(String input){
        input = input.toLowerCase().replaceAll("[-]", " ");
        String[] words = input.trim().split("\\s+");

        int res = 0;
        int cur = 0;

        for(String word : words){
            if(numberMap.containsKey(word)){
                cur += numberMap.get(word);
            } else if(word.equals("hundred")){
                cur *= 100;
            } else if(multiplierMap.containsKey(word)){
                cur *= multiplierMap.get(word);
                res += cur;
                cur = 0;
            }
        }

        return res + cur;
    }

    public static void main(String[] args) {
        String input = "Two Billion One Hundred Forty Seven Million Four Hundred Eighty Three Thousand Six Hundred Forty Seven";
        System.out.print(convert(input));

        // System.out.println(convert("One Hundred Twenty Three")); // 123
        // System.out.println(convert("Nine Hundred Ninety Nine Thousand")); // 999000
        // System.out.println(convert("One Million Two")); // 1000002
    }
}
