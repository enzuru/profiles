;; Apply using: guix system reconfigure configuration.scm

(use-modules (gnu)
             (gnu packages shells)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules desktop networking ssh xorg docker)

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
                (set-xorg-configuration (xorg-configuration (keyboard-layout keyboard-layout))))
          (modify-services %desktop-services
                           (gdm-service-type config => (gdm-configuration (auto-suspend? #f))))))

 (bootloader
  (bootloader-configuration
   (bootloader grub-bootloader)
   (target "/dev/sda")
   (keyboard-layout keyboard-layout)))

 (swap-devices
  (list (uuid "5637957b-2157-44b4-a948-367a25f80743")))

 (file-systems
  (cons* (file-system
          (mount-point "/")
          (device (uuid "495afef9-3f45-4da1-aa4d-7079807b9090" 'ext4))
          (type "ext4"))
         %base-file-systems)))
