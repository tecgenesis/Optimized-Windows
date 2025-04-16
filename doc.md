# Ultimate Windows Optimizer Documentation

This document explains in detail each optimization performed by the Ultimate Windows Optimizer script.

## 1. System Restore Point

This function creates a system restore point before making any modifications, allowing you to revert changes if any problems occur.

* Enables system restore for drive C:
* Creates a restore point with the description "Point before UltimateWindowsOptimizer"

## 2. Performance Optimization

Adjusts various system settings to improve performance:

* Configures visual options for best performance
* Reduces menu display delay to 100ms
* Disables page file cleaning at shutdown
* Enables large system cache
* Optimizes prefetcher and superfetch
* Configures power plan for high performance
* Adjusts monitor and hibernation timeout settings
* Reduces application startup delay
* Reduces boot timeout to 3 seconds
* Disables unnecessary Windows features (Windows Media Player, Work Folders, XPS Services)
* Defragments and optimizes disk drives

## 3. Temporary Files Cleanup

Removes various temporary files to free up disk space:

* Current user's Temp folder
* Windows Temp folder
* Internet temporary files
* Prefetch folder
* Windows log files
* Empties Recycle Bin
* Runs Disk Cleanup tool

## 4. Telemetry and Services Disabling

Disables services and scheduled tasks that send data to Microsoft:

### Disabled services:
* DiagTrack (Connected User Experiences and Telemetry)
* dmwappushservice (WAP Push Message Routing Service)
* diagnosticshub.standardcollector.service (Diagnostics Hub Standard Collector Service)
* WerSvc (Windows Error Reporting Service)
* WMPNetworkSvc (Windows Media Player Network Sharing Service)
* WSearch (Windows Search Indexing Service)
* SysMain (Superfetch)

### Disabled scheduled tasks:
* Microsoft Compatibility Appraiser
* ProgramDataUpdater
* Autochk Proxy
* Consolidator (Customer Experience Improvement Program)
* UsbCeip
* Disk Diagnostic Data Collector
* Feedback tasks

## 5. Visual Effects

Disables visual effects to reduce resource consumption:

* Disables dragging windows with visible content
* Disables font smoothing
* Disables minimize animation
* Disables alpha selection in lists
* Disables shadows in lists
* Disables taskbar animations
* Disables Aero Peek
* Disables always hibernate thumbnails
* Hides taskbar buttons (Task View, Cortana, Feeds, Search)

## 6. Registry Optimization

Adjusts registry settings to improve performance:

* Allows executive code in physical memory (not in virtual)
* Disables NTFS last access update (improves disk performance)
* Increases NTFS memory usage
* Enables hybrid boot
* Disables storage reserves
* Optimizes TCP/IP settings
* Disables Hibernation to free up disk space

## Important Notes

* Some changes may require a restart to take effect
* It is recommended to create a restore point before running the optimizations
* Not all optimizations are suitable for all systems
* The script includes warnings and confirmations for potentially dangerous operations

---

© 2025 TecGenesis - Licensed under MIT License 