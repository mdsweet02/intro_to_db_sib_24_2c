<Window x:Class="DiplomApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Система управления дипломным проектированием" 
        Height="600" Width="1000"
        WindowStartupLocation="CenterScreen"
        Background="#F0F2F5" FontFamily="Segoe UI">

    <!-- РЕСУРСЫ: Здесь мы задаем "внешность" для элементов -->
    <Window.Resources>
        
        <!-- Цвета -->
        <SolidColorBrush x:Key="PrimaryColor" Color="#3A7CA5"/>
        <SolidColorBrush x:Key="PrimaryDarkColor" Color="#2C5F7E"/>
        <SolidColorBrush x:Key="AccentColor" Color="#D9D9D9"/>
        <SolidColorBrush x:Key="TextColor" Color="#333333"/>

        <!-- Стиль для Кнопок -->
        <Style TargetType="Button">
            <Setter Property="Background" Value="{StaticResource PrimaryColor}"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="Padding" Value="15,8"/>
            <Setter Property="Margin" Value="0,5"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" CornerRadius="5">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="{StaticResource PrimaryDarkColor}"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <!-- Стиль для Текстовых полей (TextBox) -->
        <Style TargetType="TextBox">
            <Setter Property="Padding" Value="5"/>
            <Setter Property="Margin" Value="0,0,0,15"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="BorderBrush" Value="#CCCCCC"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="VerticalContentAlignment" Value="Center"/>
            <Setter Property="Height" Value="35"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TextBox">
                        <Border Background="White" BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="4">
                            <ScrollViewer x:Name="PART_ContentHost"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Стиль для Заголовков (TextBlock) -->
        <Style x:Key="HeaderStyle" TargetType="TextBlock">
            <Setter Property="FontSize" Value="22"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Foreground" Value="{StaticResource PrimaryDarkColor}"/>
            <Setter Property="Margin" Value="0,0,0,20"/>
        </Style>

        <Style x:Key="LabelStyle" TargetType="TextBlock">
            <Setter Property="FontSize" Value="13"/>
            <Setter Property="Foreground" Value="#666666"/>
            <Setter Property="Margin" Value="0,0,0,3"/>
        </Style>

        <!-- Стиль для Таблицы (DataGrid) -->
        <Style TargetType="DataGrid">
            <Setter Property="Background" Value="White"/>
            <Setter Property="RowBackground" Value="White"/>
            <Setter Property="AlternatingRowBackground" Value="#F9FAFB"/>
            <Setter Property="HeadersVisibility" Value="Column"/>
            <Setter Property="GridLinesVisibility" Value="Horizontal"/>
            <Setter Property="HorizontalGridLinesBrush" Value="#EEEEEE"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="BorderBrush" Value="#E0E0E0"/>
            <Setter Property="RowHeight" Value="35"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="ColumnHeaderStyle">
                <Setter.Value>
                    <Style TargetType="DataGridColumnHeader">
                        <Setter Property="Background" Value="#F1F1F1"/>
                        <Setter Property="FontWeight" Value="Bold"/>
                        <Setter Property="Foreground" Value="#555"/>
                        <Setter Property="Padding" Value="10,10"/>
                        <Setter Property="BorderThickness" Value="0,0,0,1"/>
                        <Setter Property="BorderBrush" Value="#CCC"/>
                    </Style>
                </Setter.Value>
            </Setter>
            <Setter Property="CellStyle">
                <Setter.Value>
                    <Style TargetType="DataGridCell">
                        <Setter Property="Padding" Value="10,0"/>
                        <Setter Property="Template">
                            <Setter.Value>
                                <ControlTemplate TargetType="DataGridCell">
                                    <Border Padding="{TemplateBinding Padding}" Background="{TemplateBinding Background}">
                                        <ContentPresenter VerticalAlignment="Center" />
                                    </Border>
                                </ControlTemplate>
                            </Setter.Value>
                        </Setter>
                        <Style.Triggers>
                            <Trigger Property="IsSelected" Value="True">
                                <Setter Property="Background" Value="#E6F2FF"/>
                                <Setter Property="Foreground" Value="Black"/>
                                <Setter Property="BorderThickness" Value="0"/>
                            </Trigger>
                        </Style.Triggers>
                    </Style>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Стиль для Вкладок (TabItem) -->
        <Style TargetType="TabItem">
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="Padding" Value="20,10"/>
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="TabItem">
                        <Border Name="Border" Background="{TemplateBinding Background}" Margin="0,0,5,0" CornerRadius="5,5,0,0">
                            <ContentPresenter x:Name="ContentSite"
                                            VerticalAlignment="Center"
                                            HorizontalAlignment="Center"
                                            ContentSource="Header"
                                            Margin="10,2"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsSelected" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="White"/>
                                <Setter Property="Foreground" Value="{StaticResource PrimaryColor}"/>
                            </Trigger>
                            <Trigger Property="IsSelected" Value="False">
                                <Setter TargetName="Border" Property="Background" Value="#E0E0E0"/>
                                <Setter Property="Foreground" Value="#666"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

    </Window.Resources>

    <Grid Margin="20">
        <!-- Основной контейнер с тенью/рамкой -->
        <Border Background="White" CornerRadius="8" Padding="15" Effect="{x:Null}">
            <Border.Effect>
                <DropShadowEffect BlurRadius="20" ShadowDepth="1" Opacity="0.1" Color="Black"/>
            </Border.Effect>
            
            <TabControl BorderThickness="0" Background="Transparent">
                
                <!-- Вкладка 1: Отчет -->
                <TabItem Header="📊 Отчет по защите">
                    <Grid Margin="0,20,0,0">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/>
                            <RowDefinition Height="*"/>
                        </Grid.RowDefinitions>

                        <StackPanel Orientation="Horizontal" Margin="0,0,0,15">
                            <TextBlock Text="Результаты защиты дипломных работ" Style="{StaticResource HeaderStyle}" Margin="0,0,20,0" VerticalAlignment="Center"/>
                            <Button Name="btnLoadReport" Content="🔄 Обновить данные" Click="BtnLoadReport_Click" Width="180"/>
                        </StackPanel>

                        <DataGrid Name="gridReport" Grid.Row="1" AutoGenerateColumns="True" IsReadOnly="True" />
                    </Grid>
                </TabItem>

                <!-- Вкладка 2: Студенты -->
                <TabItem Header="👨‍🎓 Студенты">
                    <Grid Margin="0,20,0,0">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="300"/>
                            <ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>

                        <!-- Левая панель: Форма добавления -->
                        <Border Grid.Column="0" Background="#F8F9FA" CornerRadius="8" Padding="20" Margin="0,0,20,0" BorderBrush="#E9ECEF" BorderThickness="1">
                            <StackPanel>
                                <TextBlock Text="Новый студент" Style="{StaticResource HeaderStyle}" FontSize="18"/>
                                
                                <TextBlock Text="ID Студента" Style="{StaticResource LabelStyle}"/>
                                <TextBox Name="txtId" />

                                <TextBlock Text="ФИО Студента" Style="{StaticResource LabelStyle}"/>
                                <TextBox Name="txtName" />

                                <Grid>
                                    <Grid.ColumnDefinitions>
                                        <ColumnDefinition Width="*"/>
                                        <ColumnDefinition Width="10"/>
                                        <ColumnDefinition Width="*"/>
                                    </Grid.ColumnDefinitions>
                                    
                                    <StackPanel Grid.Column="0">
                                        <TextBlock Text="ID Группы" Style="{StaticResource LabelStyle}"/>
                                        <TextBox Name="txtGroupId"/>
                                    </StackPanel>

                                    <StackPanel Grid.Column="2">
                                        <TextBlock Text="ID Спец." Style="{StaticResource LabelStyle}"/>
                                        <TextBox Name="txtMajorId"/>
                                    </StackPanel>
                                </Grid>

                                <TextBlock Text="Средний балл (GPA)" Style="{StaticResource LabelStyle}"/>
                                <TextBox Name="txtGpa" />

                                <Button Content="✅ Добавить в базу" Click="BtnAddStudent_Click" Margin="0,15,0,0" Height="40"/>
                            </StackPanel>
                        </Border>

                        <!-- Правая панель: Таблица -->
                        <Grid Grid.Column="1">
                            <Grid.RowDefinitions>
                                <RowDefinition Height="Auto"/>
                                <RowDefinition Height="*"/>
                            </Grid.RowDefinitions>

                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" Margin="0,0,0,10">
                                <Button Content="📂 Загрузить список" Click="BtnLoadStudents_Click" Width="160"/>
                            </StackPanel>

                            <DataGrid Name="gridStudents" Grid.Row="1" AutoGenerateColumns="True" IsReadOnly="True" />
                        </Grid>
                    </Grid>
                </TabItem>
            </TabControl>
        </Border>
    </Grid>
</Window>