using System;

namespace OSVersion
{
    public enum Distributions
    {
        Unknown = 0,
        Windows,
        WindowsServer,
        WindowsServerSAC,
        MacOS,
        CentOS,
        Debian,
        Fedora,
        Kali,
        OpenSUSE,
        RHEL,
        SLES,
        Ubuntu
    }

    public class OSVersionInfo
    {
        public Distributions Distribution { get; private set; }

        public Version Version { get; private set; }

        public string Name { get; private set; }

        public bool IsWidowsFamily
        {
            get
            {
                return this.Distribution == Distributions.Windows ||
                       this.Distribution == Distributions.WindowsServer ||
                       this.Distribution == Distributions.WindowsServerSAC;
            }
        }

        public bool IsRedHatFamily
        {
            get
            {
                return this.Distribution == Distributions.RHEL ||
                       this.Distribution == Distributions.CentOS ||
                       this.Distribution == Distributions.Fedora;
            }
        }

        public bool IsSUSEFamily
        {
            get
            {
                return this.Distribution == Distributions.OpenSUSE ||
                       this.Distribution == Distributions.SLES;
            }
        }

        public OSVersionInfo(Distributions distribution, Version version, string name)
        {
            this.Distribution = distribution;
            this.Version = version;
            this.Name = name;
        }
    }
}
