[xml]$Xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="Window" Title="Main Window" WindowStartupLocation = "CenterScreen" 
    Width = "800" Height = "600">
    <StackPanel x:Name="StackPanel">  
        <Button x:Name = "ButtonNewWindow" Width = "160" Height = "85" Background = "Lightgray" Content = "Click to create new window"/>
    </StackPanel>
</Window>
"@ 

[xml]$Xaml2 = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name="Window2" Title="New Window" WindowStartupLocation="CenterScreen"
        Height="450" Width="430" Background="White">
</Window>
"@

$Reader=(New-Object System.Xml.XmlNodeReader $Xaml)
$Window=[Windows.Markup.XamlReader]::Load( $Reader )

#Connection to Controls
$ButtonNew = $Window.FindName("ButtonNewWindow")

#Action on click ButtonNewWindow
$ButtonNew.add_Click({
    $page2 = New-Object System.Windows.Window
    $reader = (New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $Xaml2)
    $Window2 = [Windows.Markup.XamlReader]::Load($reader)
    $Window.Close()
    $Window2.ShowDialog()
})

$Window.ShowDialog()