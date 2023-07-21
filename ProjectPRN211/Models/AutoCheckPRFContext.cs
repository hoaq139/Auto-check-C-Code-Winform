using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace ProjectPRN211.Models
{
    public partial class AutoCheckPRFContext : DbContext
    {
        public AutoCheckPRFContext()
        {
        }

        public AutoCheckPRFContext(DbContextOptions<AutoCheckPRFContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Grade> Grades { get; set; } = null!;
        public virtual DbSet<Result> Results { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
                string ConnectionStr = config.GetConnectionString("DB");

                optionsBuilder.UseSqlServer(ConnectionStr);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Grade>(entity =>
            {
                entity.ToTable("Grade");

                entity.Property(e => e.GradeId).HasColumnName("grade_id");

                entity.Property(e => e.Grade1).HasColumnName("grade");

                entity.Property(e => e.Mssv)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("MSSV");

                entity.HasOne(d => d.MssvNavigation)
                    .WithMany(p => p.Grades)
                    .HasForeignKey(d => d.Mssv)
                    .HasConstraintName("FK__Grade__MSSV__3D5E1FD2");
            });

            modelBuilder.Entity<Result>(entity =>
            {
                entity.ToTable("Result");

                entity.Property(e => e.ResultId).HasColumnName("Result_id");

                entity.Property(e => e.Mssv)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("MSSV");

                entity.Property(e => e.PassCases).HasColumnName("passCases");

                entity.Property(e => e.Question)
                    .HasMaxLength(3)
                    .IsUnicode(false)
                    .HasColumnName("question");

                entity.HasOne(d => d.MssvNavigation)
                    .WithMany(p => p.Results)
                    .HasForeignKey(d => d.Mssv)
                    .HasConstraintName("FK__Result__MSSV__3E52440B");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.RoleName).HasMaxLength(50);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Mssv)
                    .HasName("PK__User__6CB3B7F986BB18C0");

                entity.ToTable("User");

                entity.Property(e => e.Mssv)
                    .HasMaxLength(8)
                    .IsUnicode(false)
                    .HasColumnName("MSSV");

                entity.Property(e => e.Password)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK__User__RoleID__3F466844");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
