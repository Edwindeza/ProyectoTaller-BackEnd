# -*- coding: utf-8 -*-
# Generated by Django 1.9.6 on 2016-07-07 01:53
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('webapp', '0005_auto_20160629_1219'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='tramite',
            options={'ordering': ('-visita',)},
        ),
        migrations.AddField(
            model_name='usuariotramite',
            name='estado',
            field=models.CharField(blank=True, choices=[('NUEVO', 'NUEVO'), ('PERDIDO', 'PERDIDO'), ('EN MOVIMIENTO', 'EN MOVIMIENTO'), ('FINALIZADO', 'FINALIZADO')], max_length=25, null=True),
        ),
        migrations.AddField(
            model_name='usuariotramite',
            name='oficina',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='ut_oficina', to='webapp.Oficina'),
        ),
        migrations.AlterField(
            model_name='usuariotramite',
            name='anexos',
            field=models.ManyToManyField(blank=True, related_name='anexos', to='webapp.Anexo'),
        ),
    ]