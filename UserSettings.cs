using System;
using System.IO;

class UserSettings
{
    // Question 2.1: Check if a specific feature is enabled
    public static bool IsFeatureEnabled(string settings, int setting)
    {
        int settingsInt = Convert.ToInt32(settings, 2);
        return (settingsInt & (1 << (setting - 1))) != 0;
    }

    // Question 2.2: Write settings to a file in the least amount of space
    public static void WriteSettingsToFile(string settings, string filePath)
    {
        byte[] settingsBytes = new byte[] { Convert.ToByte(settings, 2) };
        File.WriteAllBytes(filePath, settingsBytes);
    }

    // Question 2.2: Read settings from a file
    public static string ReadSettingsFromFile(string filePath)
    {
        byte[] settingsBytes = File.ReadAllBytes(filePath);
        return Convert.ToString(settingsBytes[0], 2).PadLeft(8, '0');
    }

    // Main method to demonstrate both Question 2.1 and 2.2
    public static void Main(string[] args)
    {
        // Question 2.1: Checking if a specific feature is enabled
        Console.WriteLine("Checking if feature 7 is enabled in '00000000':");
        bool isEnabled = IsFeatureEnabled("00000000", 7);
        Console.WriteLine($"Feature 7 Enabled: {isEnabled}");  // Output: False

        Console.WriteLine("Checking if feature 4 is enabled in '11111111':");
        isEnabled = IsFeatureEnabled("11111111", 4);
        Console.WriteLine($"Feature 4 Enabled: {isEnabled}");  // Output: True

        // Question 2.2: Writing and reading settings to/from a file
        string settings = "11010101";
        string filePath = "settings.bin";
        
        // Writing settings to the file
        Console.WriteLine("Writing settings to file...");
        WriteSettingsToFile(settings, filePath);

        // Reading settings from the file
        Console.WriteLine("Reading settings from file...");
        string readSettings = ReadSettingsFromFile(filePath);
        Console.WriteLine($"Settings Read from File: {readSettings}");  // Should print "11010101"
    }
}
