;; Apply using: guix system reconfigure configuration.scm

(use-modules (gnu)
             (gnu packages shells)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules desktop networking ssh xorg docker mcron)

(operating-system
 (locale "en_US.utf8")
 (timezone "America/New_York")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "guix")
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (users (cons* (user-account
                (name "enzuru")
                (comment "Ahmed Khanzada")
                (group "users")
                (home-directory "/home/enzuru")
                (shell (file-append fish "/bin/fish"))
                (supplementary-groups '("wheel" "netdev" "audio" "video" "docker")))
               %base-user-accounts))

 (packages
  (append (list (specification->package "openbox")
                (specification->package "fish")
                (specification->package "nss-certs"))
          %base-packages))

 (services
  (append (list (service openssh-service-type)
                (service tor-service-type)
                (service docker-service-type)
                (service mcron-service-type)
                (set-xorg-configuration (xorg-configuration (keyboard-layout keyboard-layout)
                                                            (extra-config
                                                             '("Section \"Device\"
  Identifier \"AMD\"
  Driver \"amdgpu\"
  Option \"SWcursor\" \"on\"
EndSection")))))
          (modify-services %desktop-services
                           (gdm-service-type config =>
                                             (gdm-configuration (auto-suspend? #f)
                                                                (debug? #f))))))

 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))

 (swap-devices (list (swap-space
                      (target (uuid
                               "5154f36a-9be4-47b9-ae77-089fc234c98d")))))

 (file-systems (cons* (file-system
                       (mount-point "/boot/efi")
                       (device (uuid "3848-FEE3"
                                     'fat32))
                       (type "vfat"))
                      (file-system
                       (mount-point "/")
                       (device (uuid
                                "bb69c1c2-2301-484a-bdef-cad5b0eec09e"
                                'ext4))
                       (type "ext4")) %base-file-systems)))
